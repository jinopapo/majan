class UserCompController < ApplicationController
  def index
    @user = User.all
    @map = {}
    @user.each do |var|
      @map[var.name] = {}
    end
    @user.each do |player|
      player_score = Score.where("user_id = '#{player.id}'")
      @user.each do |enemy|
        if player.name == enemy.name then
          @map[player.name][enemy.name] = nil
        else
          scores  = []
          player_score.each do |var|
            comp_score = Score.find_by("user_id = '#{enemy.id}' and hand_id = '#{var.hand_id}'")
            if Score.find_by("user_id = '#{enemy.id}' and hand_id = '#{var.hand_id}'") then
              scores.push(var["score"])
            end
          end
          if scores.size == 0 then
            @map[player.name][enemy.name] = 0
          else
            @map[player.name][enemy.name] = scores.inject(0.0){|r,i| r+=i }/scores.size
          end
        end
      end
    end
    p @map
  end
end
