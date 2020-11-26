# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'activerecord-reset-pk-sequence'

ActiveRecord::Base.connection.disable_referential_integrity do
  LineItem.delete_all
  LineItem.reset_pk_sequence
  Item.delete_all
  Item.reset_pk_sequence
  Cart.delete_all
  Cart.reset_pk_sequence
  Order.delete_all
  Order.reset_pk_sequence
  User.delete_all
  User.reset_pk_sequence
  puts 'DB cleaned up !'
end

########## - USERS - ##########
10.times do
  User.create!(
    email: Faker::Internet.unique.email(domain: 'yopmail.com'),
    password: Faker::Internet.password(min_length: 6, max_length: 20),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
  )
end
puts "#{User.count}/10 users created"


########## - ITEMS - ##########
kitten_pixes = [
  'https://images.pexels.com/photos/2558605/pexels-photo-2558605.jpeg?auto=compress&cs=tinysrgb&h=350',
  'https://images.pexels.com/photos/257532/pexels-photo-257532.jpeg?auto=compress&cs=tinysrgb&h=350',
  'https://images.pexels.com/photos/290164/pexels-photo-290164.jpeg?auto=compress&cs=tinysrgb&h=350',
  'https://images.pexels.com/photos/596590/pexels-photo-596590.jpeg?auto=compress&cs=tinysrgb&h=350',
  'https://images.pexels.com/photos/141496/pexels-photo-141496.jpeg?auto=compress&cs=tinysrgb&h=350',
  'https://images.pexels.com/photos/1870376/pexels-photo-1870376.jpeg?auto=compress&cs=tinysrgb&h=350',
  'https://images.pexels.com/photos/171227/pexels-photo-171227.jpeg?auto=compress&cs=tinysrgb&h=350',
  'https://images.pexels.com/photos/2061057/pexels-photo-2061057.jpeg?auto=compress&cs=tinysrgb&h=350', 
  'https://images.pexels.com/photos/669015/pexels-photo-669015.jpeg?auto=compress&cs=tinysrgb&h=350',
  'https://images.pexels.com/photos/2643812/pexels-photo-2643812.jpeg?auto=compress&cs=tinysrgb&h=350', 
  'https://images.pexels.com/photos/2181171/pexels-photo-2181171.jpeg?auto=compress&cs=tinysrgb&h=350',
  'https://images.pexels.com/photos/2581153/pexels-photo-2581153.jpeg?auto=compress&cs=tinysrgb&h=350', 
  'https://images.pexels.com/photos/1120049/pexels-photo-1120049.jpeg?auto=compress&cs=tinysrgb&h=350',
  'https://images.pexels.com/photos/209800/pexels-photo-209800.jpeg?auto=compress&cs=tinysrgb&h=350', 
  'https://images.pexels.com/photos/1275451/pexels-photo-1275451.jpeg?auto=compress&cs=tinysrgb&h=350',
  'https://images.pexels.com/photos/731553/pexels-photo-731553.jpeg?auto=compress&cs=tinysrgb&h=350', 
  'https://images.pexels.com/photos/416160/pexels-photo-416160.jpeg?auto=compress&cs=tinysrgb&h=350',
  'https://images.pexels.com/photos/2194261/pexels-photo-2194261.jpeg?auto=compress&cs=tinysrgb&h=350', 
  'https://images.pexels.com/photos/735423/pexels-photo-735423.jpeg?auto=compress&cs=tinysrgb&h=350',
  'https://images.pexels.com/photos/4790615/pexels-photo-4790615.jpeg?auto=compress&cs=tinysrgb&h=350', 
  'https://images.pexels.com/photos/774731/pexels-photo-774731.jpeg?auto=compress&cs=tinysrgb&h=350', 
]

kitten_images = [
  'kitten1.jpg',
  'kitten2.jpg',
  'kitten3.jpg',
  'kitten4.jpg',
  'kitten5.jpg',
  'kitten6.jpg',
  'kitten7.jpg',
  'kitten8.jpg',
  'kitten9.jpg',
  'kitten10.jpg',
  'kitten11.jpg',
  'kitten12.jpg',
  'kitten13.jpg',
  'kitten14.jpg',
  'kitten15.jpg',
  'kitten16.jpg',
  'kitten17.jpg',
  'kitten18.jpg',
  'kitten19.jpg',
  'kitten20.jpg',
  'kitten21.jpg',
]

20.times do |i|
  curent_item = Item.create!(
    title: Faker::Creature::Cat.unique.name,
    description: Faker::Lorem.paragraph(sentence_count: 4),
    price: Faker::Number.positive(from: 50.00, to: 500.00).round(2),
    image_url: kitten_pixes[i],
  )

  curent_item.picture.attach(
    io: File.open(
      Rails.root.join(
        'app', 'assets', 'images', kitten_images[i]
      )
    ), filename: kitten_images[i],
    content_type: 'image/jpg'
  )
end
puts "#{Item.count}/20 items created"

########## - CARTS - ##########
5.times do |i|
  Cart.create!(
    user_id:  i + 1,
  )
end
puts "#{Cart.count}/5 carts created"

######### - ORDERS - ##########
5.times do |i|
  Order.create!(
    user_id:  i + 1,
  )
end
puts "#{Order.count}/5 orders created"

######### - LINE ITEMS - ##########
5.times do |i|
  3.times do
    rand_number = rand(1..5)
    rand_item = rand(1..10)
    LineItem.create!(
      cart_id: i + 1,
      order_id: i + 1,
      item_id: rand_item,
      quantity: rand_number,
      subtotal: Item.find_by(id: rand_item).price * rand_number
    )
  end
end
puts "#{LineItem.count}/ 15 line_items created"
