class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :reviews
  has_many :favorites , dependent: :destroy
  has_many :favoritings, through: :favorites, source: :review
  
  def favorite(other_review)
    self.favorites.find_or_create_by(review_id: other_review.id)
  end

  def unfavorite(other_review)
    favorite = self.favorites.find_by(review_id: other_review.id)
    favorite.destroy if favorite
  end

  def favoriting?(other_review)
    self.favoritings.include?(other_review)
  end
  
end
