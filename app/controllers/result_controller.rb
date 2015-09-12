# coding: utf-8
class ResultController < ApplicationController

  def index
    @hands = Hand.order("created_at DESC")
    @users = User.all
    @result_title = "結果一覧"
  end

  def graph
    @hands = Hand.all
    @users = User.all
  end

  def rank
    @score_sum = Score.order("sum_score DESC").group(:user_id).sum(:score)
    @score_ave = Score.order("average_score DESC").group(:user_id).average(:score)
    @rank_ave = Score.order("average_rank").group(:user_id).average(:rank)
    @users = User.all
  end
end
