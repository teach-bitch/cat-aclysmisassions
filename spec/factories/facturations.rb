FactoryBot.define do
  factory :facturation do
    basket_id { FactoryBot.create(:basket).id }
    price { rand(1.0..1337.0).round(2) }
  end
end
