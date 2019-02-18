# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


(1..90).each do |single|
  Customer.create(name: Faker::Name.name, address: Faker::Address.full_address, contact_no: Faker::PhoneNumber.cell_phone_with_country_code, email: Faker::Internet.email, gender: Faker::Gender.binary_type, status: 'PENDING', created_at: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today))
end

Category.create(id: 1, name: "Birthday Cake", description: "Cake for birthdays")
Category.create(id: 2, name: "Wedding Cake", description: "Cake for Wedding")
Category.create(id: 3, name: "Anniversary Cake", description: "Cake for Anniversary")
Category.create(id: 4, name: "Normal Cake", description: "Cake for Normal People")

(1..10).each do |single|
  Product.create(name: Faker::Dessert.variety, description: Faker::Lorem.sentence(10), category_id: 1, stock: Faker::Number.number(3))
end

(1..2).each do |single|
  Product.create(name: Faker::Dessert.variety, description: Faker::Lorem.sentence(10), category_id: 2, stock: Faker::Number.number(3))
end

(1..22).each do |single|
  Product.create(name: Faker::Dessert.variety, description: Faker::Lorem.sentence(10), category_id: 3, stock: Faker::Number.number(3))
end

(1..7).each do |single|
  Product.create(name: Faker::Dessert.variety, description: Faker::Lorem.sentence(10), category_id: 4, stock: Faker::Number.number(3))
end

(1..100).each do |single|
  Order.create(
    ordered_at: Faker::Date.between(1.year.ago, Date.today), 
    customer_id: Faker::Number.number(2),
    product_id: Faker::Number.number(2),
    no_of_items: Faker::Number.number(1)
  )
end