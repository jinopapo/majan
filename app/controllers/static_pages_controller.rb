# coding: utf-8
require 'score_lib'
include ScoreLib

class StaticPagesController < ApplicationController
  def home
  end

  def input
    if admin_user != nil then
      @users = User.all
      @hands = Hand.order("created_at DESC").limit(10)
      @name_flag = false
      @score_flag = false
      @result_title = "最近の結果"
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
      for wind in [:ton,:nan,:sha,:pei]
        scr = {:score => params[wind][:score].to_i,:name => params[wind][:name]}
        sum += scr[:score]
        names.push(scr[:name])
        score.push(scr)
      end
      if names.uniq.size != 4 then
        @name_flag = true

        render "input"
      elsif sum != 100000 then
        @score_flag = true
        render "input"
      end
      if !@name_flag && !@score_flag then
        score = uma(score)
        hand = Hand.create()
        score.each_with_index do |var,index|
          Score.create(score: var[:score],user_id: var[:name],hand_id: hand.id,rank: 4 - index)
        end
        redirect_to "/input"
      end
    else
      redirect_to "/admin"
    end
  end
end
