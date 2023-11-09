# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#Create Users
30.times do 
    User.create!(
        email: Faker::Internet.email,
        password: "secrets",
        name: Faker::Name.name,
        address: Faker::Address.full_address
    )
end

# create company
5.times do 
    Company.create!(
        name: Faker::Company.name
    )
end

# create category 
Category.create([
    { name: "Jewelries" }, 
    { name: "Automobile" }, 
    { name: "Appareals" }, 
    { name: "Housing" }, 
    { name: "Pets" }
])

#Create Products
19.times do 
    Product.create!(
        name: Faker::Commerce.product_name,
        price: Faker::Commerce.price,
        img: Faker::Avatar.image(size: "300x300"),
        description: Faker::Lorem.paragraph,
        company_id: Company.all.sample.id,
        category_id: Category.all.sample.id
    )
end
#Create Orders
96.times do
    Order.create!(
        product_id: Product.all.sample.id,
        user_id: User.all.sample.id,
        company_id: Company.all.sample.id,
        quantity: Faker::Number.decimal_part(digits: 1),
        price: Faker::Commerce.price,
        product_name: Product.all.sample.name
    )
end
#Create Reviews
  120.times do
    Review.create!(
        user_id: User.all.sample.id,
        product_id: Product.all.sample.id,
        rating: Faker::Number.between(from: 1, to: 5),
        review_text: Faker::Lorem.paragraph,
        user_name: User.all.sample.name
    )   
end
