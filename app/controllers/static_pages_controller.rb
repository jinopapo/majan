class StaticPagesController < ApplicationController
  def home
  end

  def input
    if admin_user != nil then
      @users = User.all
      @hands = Hand.order("created_at DESC").limit(10)
      @name_flag = false
      @score_flag = false
    else
      redirect_to "/admin"
    end

  end

  def create
    if admin_user != nil then
      input()
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
        uma = [-10,-5,5]
        top_score = 0;
        for num in 0..2 do
          score[num][:score] += 400
          score[num][:score] = (score[num][:score]/1000).to_i
          score[num][:score] = uma[num] + score[num][:score] - 30
          top_score += score[num][:score];
          Score.create(score: score[num][:score],user_id: score[num][:name],hand_id: hand.id,rank: 4 - num)
        end
        Score.create(score: -top_score,user_id: score[3][:name],hand_id: hand.id,rank: 1)
      end
      redirect_to "/input"
    else
      redirect_to "/admin"
    end
  end
end
