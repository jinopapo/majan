# coding: utf-8
require "date"

class ResultController < ApplicationController

  def index
    d = Date.today
    if d.month < 4
      queries = "created_at > '#{d.year-1}-04-01'"
    else
      queries = "created_at > '#{d.year}-04-01'"
    end
    @hands = Hand.where(queries).order("created_at DESC")
    @users = User.all
    @result_title = "結果一覧"
  end

  def graph
    d = Date.today
    if d.month < 4
      queries = "created_at > '#{d.year-1}-04-01'"
    else
      queries = "created_at > '#{d.year}-04-01'"
    end
    @hands = Hand.where(queries)
    @users = User.all
  end

  def rank
    d = Date.today
    if d.month < 4
      queries = "created_at > '#{d.year-1}-04-01'"
    else
      queries = "created_at > '#{d.year}-04-01'"
    end
    @score_sum = Score.where(queries).order("sum_score DESC").group(:user_id).sum(:score)
    @score_ave = Score.where(queries).order("average_score DESC").group(:user_id).average(:score)
    @rank_ave = Score.where(queries).order("average_rank").group(:user_id).average(:rank)
    @users = User.all
  end
end
