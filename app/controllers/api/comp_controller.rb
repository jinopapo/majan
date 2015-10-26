module Api
  class CompController < ApplicationController
    def comp
      user = User.all
      score = Score.where("user_id = '#{params[:id]}'")
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
            data[u.name] = Score.order("average_score DESC").group(:user_id).average(:score)
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
