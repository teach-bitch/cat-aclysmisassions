FactoryBot.define do
  factory :category do
    title { Faker::Food.fruits }
  end
end
