# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

#create users
2.times do
 user = User.new(
   full_name:     Faker::Name.name,
   email:    Faker::Internet.email,
   password: 'helloworld'
 )
 user.skip_confirmation!
 user.save!
end

brock = User.new(
  full_name:     'brock',
  email: 'brockdonovan@gmail.com',
  password: 'helloworld'
)
brock.skip_confirmation!
brock.save!

users = User.all

# Create Lists
5.times do
 List.create!(
  title: Faker::Hacker.noun,
  user_id: users.sample.id,
  permissions: ["private", "viewable", "open"].sample
 )
end

lists = List.all

# Create items
20.times do
 Item.create!(
   description:  Faker::Commerce.product_name,
   user_id: users.sample.id,
   list_id: lists.sample.id,
   complete: [true, false].sample
 )
end
items = Item.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Item.count} Items created"