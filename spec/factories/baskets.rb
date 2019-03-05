FactoryBot.define do
  factory :basket do
    user_id { FactoryBot.create(:user).id }
    product_id { FactoryBot.create(:product).id }
    quantity { rand(1..100) }
  end
end
