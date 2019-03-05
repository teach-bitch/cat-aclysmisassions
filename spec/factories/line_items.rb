FactoryBot.define do
  factory :line_item do
    basket { nil }
    product { nil }
    quantity { 1 }
  end
end
