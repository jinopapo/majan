module Api
  class ResultController < ApplicationController
    def score_sum
      score = Score.order(:created_at)
      users = User.all
      data = {}
      users.each do |var|
        data[var.name]=data.fetch(var.name,[])
      end
      score.each_slice 4 do |var|
        users.each do |key|
          now = 0
          var.each do |v|
            if key.id == v.user_id then
              now = v.score
            end
          end
          if data[key.name].size == 0 then
            data[key.name] = data[key.name].push(now)
          else
            data[key.name] = data[key.name].push(data[key.name].last + now)
          end
        end
      end
      render :json => data
    end
  end
end
