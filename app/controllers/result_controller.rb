class ResultController < ApplicationController
  def index
    @hands = Hand.order("created_at DESC")
    @users = User.all
  end
  def graph
    @hands = Hnad.all
    @users = User.all
  end
end
