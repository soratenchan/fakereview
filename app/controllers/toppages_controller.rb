class ToppagesController < ApplicationController
  def index
    @reviews = Review.all.order(created_at: :desc).page(params[:page]).per(5)   
  end
  

end
