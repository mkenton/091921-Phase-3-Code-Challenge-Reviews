# This will delete any existing rows from the Product and User tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting old data..."
Product.destroy_all
User.destroy_all
Review.destroy_all

puts "Creating users..."
user1 = User.create(name: Faker::Name.name)
user2 = User.create(name: Faker::Name.name)
user3 = User.create(name: Faker::Name.name)

puts "Creating products..."
product1 = Product.create(name: "Stapler", price: 10)
product2 = Product.create(name: "Whiteboard", price: 15)
product3 = Product.create(name: "Dry Erase Markers", price: 5)
product4 = Product.create(name: "Ballpoint Pens", price: 2)
product5 = Product.create(name: "Scotch Tape", price: 3)

puts "Creating reviews..."
# *****************************************************************
# * TODO: create reviews! Remember, a review belongs to a product *
# * and a review belongs to an user.                              *
# *****************************************************************
# Create Reviews Here
stapler_u1_r1 = Review.create(star_rating: 4, comment: "I would give 5 stars, but I believe someone has my stapler.", product_id: product1.id, user_id: user1.id)
stapler_u2_r1 = Review.create(star_rating: 5, comment: "Best stapler! I borrowed it but I like it so much that I don't think I'm going to give it back!", product_id: product1.id, user_id: user2.id)
stapler_u2_r1 = Review.create(star_rating: 5, comment: "Great pen! I found it on my co-worker's desk!", product_id: product4.id, user_id: user2.id)

puts "Seeding done!"
puts
puts "Review#user for first review:"
puts Review.first.user.name
puts
puts "Review#product for first reveiw"
puts Review.first.product.name
puts
puts "Testing all review comments for user 2"
puts user2.reviews.map(&:comment)