class ReviewsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      flash[:success] = 'レビューを投稿しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'レビューの投稿に失敗しました。'
      render 'reviews/new'
    end
  end

  def destroy
    @review.destroy
    flash[:success] = 'レビューを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  def new
    if logged_in?
      @review = current_user.reviews.build  
    end    
  end
  
  private
  
  def review_params
    params.require(:review).permit(:type,:title,:content)
  end  

  def correct_user
    @review = current_user.reviews.find_by(id: params[:id])
    unless @review
      redirect_to root_url
    end
  end  

end
