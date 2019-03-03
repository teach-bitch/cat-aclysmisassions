class Product < ApplicationRecord
  belongs_to :category
  has_one_attached :image
  has_many :baskets
  has_many :users, through: :baskets
end
