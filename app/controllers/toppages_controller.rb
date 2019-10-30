class ToppagesController < ApplicationController
  def index
    @reviews = Review.all.order(created_at: :desc).page(params[:page]).per(5)   
  end
  
  def rank
    review_like_count = Review.joins(:favorites).group(:review_id).count  
    review_liked_ids = Hash[review_like_count.sort_by{ |_, v| -v }].keys
    @review_ranking= Review.where(id: review_liked_ids)
    @review_all = @review_ranking.all.page(params[:page]).per(5)  
    
  end  
  

end
