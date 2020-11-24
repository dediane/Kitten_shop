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
  User.delete_all
  User.reset_pk_sequence
  Item.delete_all
  Item.reset_pk_sequence
  Cart.delete_all
  Cart.reset_pk_sequence
  Order.delete_all
  Order.reset_pk_sequence
  LineItem.delete_all
  LineItem.reset_pk_sequence
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
puts '10 users created'


########## - ITEMS - ##########

kitten_pixes = [
  'https://www.pexels.com/fr-fr/photo/adorable-animal-animal-de-compagnie-animal-domestique-2558605/',
  'https://www.pexels.com/fr-fr/photo/adorable-animal-animal-de-compagnie-arbre-257532/',
  'https://www.pexels.com/fr-fr/photo/a-fourrure-a-poils-adorable-animal-290164/',
  'https://www.pexels.com/fr-fr/photo/a-l-interieur-adorable-animal-animal-de-compagnie-596590/',
  'https://www.pexels.com/fr-fr/photo/adorable-amusant-animal-animal-de-compagnie-141496/',
  'https://www.pexels.com/fr-fr/photo/adorable-animal-de-compagnie-chat-chaton-1870376/',
  'https://www.pexels.com/fr-fr/photo/adorable-animal-animal-de-compagnie-blanc-171227/',
  'https://www.pexels.com/fr-fr/photo/adorable-animal-animal-de-compagnie-chat-2061057/',
  'https://www.pexels.com/fr-fr/photo/adorable-animal-animal-de-compagnie-anxieux-669015/',
  'https://www.pexels.com/fr-fr/photo/adorable-animal-animal-de-compagnie-animal-domestique-2643812/',
  'https://www.pexels.com/fr-fr/photo/adorable-animal-animal-de-compagnie-animal-domestique-2181171/',
  'https://www.pexels.com/fr-fr/photo/adorable-animal-animal-de-compagnie-animal-domestique-2581153/',
  'https://www.pexels.com/fr-fr/photo/adorable-animal-animal-de-compagnie-bebe-1120049/',
  'https://www.pexels.com/fr-fr/photo/a-fourrure-a-poils-adorable-animal-209800/',
  'https://www.pexels.com/fr-fr/photo/animal-animal-de-compagnie-chat-chat-domestique-1275451/',
  'https://www.pexels.com/fr-fr/photo/adorable-animal-animal-de-compagnie-bebe-731553/',
  'https://www.pexels.com/fr-fr/photo/animal-chaton-dormir-felin-416160/',
  'https://www.pexels.com/fr-fr/photo/adorable-animal-animal-de-compagnie-animal-domestique-2194261/',
  'https://www.pexels.com/fr-fr/photo/adorable-animal-animal-de-compagnie-animal-domestique-735423/',
  'https://www.pexels.com/fr-fr/photo/amusant-animal-animal-de-compagnie-bailler-56857/'
]

20.times do |i|
  Item.create!(
    title: Faker::Creature::Cat.name,
    description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
    price: Faker::Number.decimal(l_digits: 2),
    image_url: kitten_pixes[i],
  )
end
puts '20 items created'




