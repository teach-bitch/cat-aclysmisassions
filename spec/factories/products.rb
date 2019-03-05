FactoryBot.define do
  factory :product do
    category_id { FactoryBot.create(:category).id }
    title { Faker::JapaneseMedia::OnePiece.akuma_no_mi }
    description { Faker::JapaneseMedia::OnePiece.quote }
    price { rand(1.0..99.99).round(2) }
    quantity { rand(1..100) }
    reference { Faker::IDNumber.spanish_citizen_number }
  end
end
