class UserCompController < ApplicationController
  def index
    @user = User.all
    @map = {}
    @user.each do |var|
      @map[var.name] = @map.fetch(var.name,[0])
    end
    @user.each do |player|
      @user.each do |enemy|
        if player.name == enemy.name then
          @map[player.name].push(nil)
        else
          player_score = Score.where("user_id = '#{player.id}'")
          scores  = []
          player_score.each do |var|
            if Score.find_by("user_id = '#{enemy.id}' and hand_id = '#{var.hand_id}'") then
              scores.push(var["score"])
            end
          end
          if scores.size == 0 then
            @map[player.name].push(0)
          else
            @map[player.name].push(scores.inject(0.0){|r,i| r+=i }/scores.size)
          end
        end
      end
    end
  end
end
