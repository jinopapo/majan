require "date"

module Api
  class CompController < ApplicationController
    def comp
      d = Date.today
      if d.month < 4
        queries = "created_at > '#{d.year-1}-04-01'"
      else
        queries = "created_at > '#{d.year}-04-01'"
      end
      user = User.where(queries)
      score = Score.where(queries).where("user_id = '#{params[:id]}'")
      data = {}
      user.each do |u|
        scores  = []
        score.each do |var|
          comp_score = Score.find_by("user_id = '#{u.id}' and hand_id = '#{var.hand_id}'")
          if !comp_score.nil? then
            scores.push(var["score"])
          end
        end
        if scores.size == 0
          if u.id == params[:id]
            data[u.name] = Score.order("average_score DESC").group(:user_id).average(:score,:conditions => ["user_id = #{u.id}"])
           else
            data[u.name] = nil
          end
        else
          data[u.name] = scores.inject(0.0){|r,i| r+=i }/scores.size
        end
      end
      render :json => data
    end
  end
end
