require 'faker'

a = Admin.find_by_id(1) || Admin.create(id: 1, username: 'admin', password: 'admin', name: 'admin', email: 'admin@email.com')
a.save

(1..15).each do |single|
  Customer.create( 
    id: single, 
    name: Faker::Name.name, 
    address: Faker::Address.full_address, 
    contact_no: Faker::PhoneNumber.cell_phone_with_country_code, 
    email: Faker::Internet.email, 
    gender: Faker::Gender.binary_type, 
    status: 'PENDING', 
    created_at: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today), 
    status: "Confirmed", 
    password: "asdf"
  )
end

Category.create(id: 1, name: "Birthday Cake", description: "Cake for birthdays")
Category.create(id: 2, name: "Wedding Cake", description: "Cake for Wedding")
Category.create(id: 3, name: "Anniversary Cake", description: "Cake for Anniversary")
Category.create(id: 4, name: "Normal Cake", description: "Cake for Normal People")

(1..30).each do |single|
  Product.create(
    name: Faker::Dessert.variety, 
    description: Faker::Dessert.flavor + " with " + Faker::Dessert.topping, 
    category_id: Faker::Number.between(1, 4) , 
    stock: 5
  )
  (1..6).each do |i|
    Size.create(label: Size::SIZES[i - 1], price: 300 * i, product_id: single)
  end
end

(1..30).each do |single|
  Order.create(
    # id: single, 
    ordered_at: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today), 
    customer_id: Faker::Number.between(1, 15),
    product_id: Faker::Number.between(1, 30),
    size_id: Faker::Number.between(1, 180),
    no_of_items: Faker::Number.between(1, 5),
    payment_method: "COD", 
    status: 'Delivered',
    delivery_location: Faker::Address.full_address, 
    delivered_at: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today),
    note: Faker::Lorem.sentence,
    cart: false,
    date_to_be_delivered: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today)
  )

end
