class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    review = Review.find(params[:review_id])
    current_user.favorite(review)
    flash[:success] = 'お気に入りに追加しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    review = Review.find(params[:review_id])
    current_user.unfavorite(review)
    flash[:success] = 'お気に入りを削除しました。'
    redirect_back(fallback_location: root_path)
  end

end