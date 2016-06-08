module Api
  class ResultController < ApplicationController

    def score_sum
      d = Date.today
      data = []
      if d.month < 4
        queries = "created_at > '#{d.year-1}-04-01'"
      else
        queries = "created_at > '#{d.year}-04-01'"
      end
      score = Score.where(queries).order(:created_at)
      users = User.all
      data = {}
      users.each do |var|
        hoge = Score.where("user_id = '#{var.id}'")
        if hoge.size >= 10 then
          data[var.name]=data.fetch(var.name,[0])
        end
      end
      score.each_slice 4 do |var|
        users.each do |key|
          now = 0
          var.each do |v|
            if key.id == v.user_id then
              now = v.score
            end
          end
          if !data[key.name].nil?
            data[key.name] = data[key.name].push(data[key.name].last + now)
          end
        end
      end
      render :json => data
    end

    def all
      data = []
      queries = "created_at > '#{params[:year]}-04-01' AND created_at < '#{params[:year].to_i+1}-04-01'"
      hands = Hand.where(queries).order("created_at DESC")
      users = User.all
      hands.each do |hand|
        game = {}
        rank = 1
        hand.scores.reverse.each do |score|
          game[rank] = [users.find(score.user_id).name,score.score]
          rank += 1
        end
        if !game.empty?
          data << game
        end
      end
      render :json => data
    end

    def makeHash(idata,users)
      data = []
      idata.each do |key,val|
        score = {}
        score["name"] = users.find(key).name
        score["score"] = val
        data << score
      end
      return data
    end

    def rank
      data = {}
      queries = "created_at > '#{params[:year]}-04-01' AND created_at < '#{params[:year].to_i+1}-04-01'"
      users = User.all
      score_sum = Score.where(queries).order("sum_score DESC").group(:user_id).sum(:score)
      data["score_sum"] = makeHash(score_sum,users)
      score_ave = Score.where(queries).order("average_score DESC").group(:user_id).average(:score)
      data["score_ave"] = makeHash(score_ave,users)
      rank_ave = Score.where(queries).order("average_rank").group(:user_id).average(:rank)
      data["rank_ave"] = makeHash(rank_ave,users)
      render :json => data
    end

  end
end
