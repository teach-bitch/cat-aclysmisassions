class Product < ApplicationRecord
  has_one_attached :image
  has_many :line_items, dependent: :nullify
  has_many :product_categories
  has_many :categories, through: :product_categories
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title,
    presence: true,
    length: { in: 3..140 }

  validates :price,
    presence: true,
    numericality: { greater_than: 0, less_than: 1001 }

  validates :description,
    presence: true,
    length: { in: 10..1000 }

  validates_length_of :description,
   :minimum   => 10,
   :maximum   => 1000,
   :too_short => "must have at least 20 characters",
   :too_long  => "must have at most 1000 characters"

end
