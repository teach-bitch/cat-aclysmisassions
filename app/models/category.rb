class Category < ApplicationRecord
	has_many :product_categories
  has_many :products, through: :product_categories

	validates :title,
		presence: true,
		length: { in: 2..15 }

end
