# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Product.destroy_all

puts "Generating user"

user = User.new(first_name: "teste", last_name: "teste", email: "teste@teste.com", password: "123123")

puts 'Generating ten products'

10.times do
  product = Product.new(
    name: Faker::Restaurant.name,
    description: Faker::Restaurant.description,
    price: Faker::Number.decimal(l_digits: 2),
    quantity: rand(1..10),
    user: user
  )
  product.save!
end

puts 'Finished!'
