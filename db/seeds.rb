# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Caregory

Category.destroy_all

category_list = [
  {name: "Taiwanese Food"},
  {name: "Chinese Food"},
  {name: "Japanese Food"},
  {name: "Korean Food"},
  {name: "Singaporean Food"},
  {name: "Western Food"},
  {name: "Veg Food"},      
]

category_list.each do |category|
  Category.create(name: category[:name])
end  

puts "Category created"