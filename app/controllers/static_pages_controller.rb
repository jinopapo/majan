class StaticPagesController < ApplicationController
  def home
  end

  def input
    @users = User.all
    @hands = Hand.order("created_at DESC").limit(10)
    @name_flag = false
    @score_flag = false
  end

  def create
    input
    names = []
    sum = 0;
    score = []
    wind = [:ton,:nan,:sha,:pei]
    for num in 0..3
      scr = {:score => params[wind[num]][:score].to_i, :rank => 3 - num, :name => params[wind[num]][:name]}
      sum += scr[:score]
      names.push(scr[:name])
      score.push(scr)
    end
    score = score.sort_by do |var|
      [var[:score], var[:rank]]
    end
    if names.uniq.size != 4 then
      @name_flag = true
    end
    if sum != 100000 then
      @score_flag = true
    end
    if !@name_flag && !@score_flag then
      hand = Hand.create()
      uma = [-10,-5,5,10]
      for num in 0..3 do
        score[num][:score] += 400
        score[num][:score] = (score[num][:score]/1000).to_i
        score[num][:score] = uma[num] + score[num][:score] - 30
        Score.create(score: score[num][:score],user_id: score[num][:name],hand_id: hand.id,rank: 4 - num)
      end
    end
    render action: :input
  end

end
