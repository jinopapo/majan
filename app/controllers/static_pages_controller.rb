class StaticPagesController < ApplicationController
  def home
  end
  def input
  end
  def input_score
    ton = params[:ton][:name]
    nan = params[:nan][:name]
    sha = params[:sha][:name]
    pei = params[:pei][:name]
    render :action => "input"
  end
end
