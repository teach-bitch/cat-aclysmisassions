# =========== DESTROY ===========

puts 'Purge de la DB en cours...'

User.destroy_all
Basket.destroy_all
LineItem.destroy_all
Product.destroy_all
ProductCategory.destroy_all
Category.destroy_all
Facturation.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('baskets')
ActiveRecord::Base.connection.reset_pk_sequence!('line_items')
ActiveRecord::Base.connection.reset_pk_sequence!('products')
ActiveRecord::Base.connection.reset_pk_sequence!('product_categories')
ActiveRecord::Base.connection.reset_pk_sequence!('categories')
ActiveRecord::Base.connection.reset_pk_sequence!('facturations')

puts 'Purge terminée.'
sleep(1)

# =========== CREATION ===========

10.times do
	user = User.create!(
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password,
    first_name: Faker::Superhero.prefix,
    last_name: Faker::Movies::HarryPotter.character,
    username: Faker::Kpop.girl_groups,
    birthdate: Faker::Date.birthday(9, 156))
    # is_admin is false by default
	print '.'
end
puts '=== User DB created ==='

5.times do
  category = Category.create!(
    title: Faker::Food.unique.fruits)
  print '.'
end
puts '=== Category DB created ==='

25.times do
  product = Product.create!(
    title: Faker::JapaneseMedia::OnePiece.unique.akuma_no_mi,
    description: Faker::JapaneseMedia::OnePiece.quote,
    price: rand(1.0..99.99).round(2),
    quantity: rand(1..100),
    brand: Faker::Gender.type,
    reference: Faker::IDNumber.unique.spanish_citizen_number)
    # eventually add an image
  print '.'
end
puts '=== Product DB created ==='

50.times do
  product_category = ProductCategory.create!(
    category_id: Category.all.sample.id,
    product_id: Product.all.sample.id)
  print '.'
end
puts '=== ProductCategory DB created ==='

10.times do
  basket = Basket.create!(
    user_id: User.all.sample.id)
  print '.'
end
puts '=== Basket DB created ==='

50.times do
  line_item = LineItem.create!(
    basket_id: Basket.all.sample.id,
    product_id: Product.all.sample.id)
  print '.'
end
puts '=== LineItem DB created ==='

50.times do
  facturation = Facturation.create!(
    basket_id: Basket.all.sample.id,
    price: rand(1.0..1337.0).round(2))
  print '.'
end
puts '=== Facturation DB created ==='
