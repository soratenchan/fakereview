class Review < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { maximum: 500 }
  validates :type, presence: true, length: { maximum: 10 }
  validates :title, presence: true, length: { maximum: 50 }
  self.inheritance_column = :_type_disabled
  
  has_many :favorites, dependent: :destroy
  has_many :favoriters, through: :favorites, source: :user  , dependent: :destroy
  
  
end
