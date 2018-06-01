require 'unirest'

# params = {
#   name: "Wonder Hair Shampoo"
#   price: 8,
#   image_url: "image_url",
#   description: "shampoo, rinse, repeat"
# }

# response = Unirest.post("")

# puts JSON.pretty_generate(response)

puts "what hair product do you want to update?"
product_id = gets.chomp

params = {
  title: "Cake!!!"
}

response = Unirest.patch("", parameters: params).body

puts JSON.pretty_generate(response)

# json.array! @recipes.each do |recipe|
#   json.id recipe.id
#   json.title recipe.title
#   json.ingredients recipe.ingredients
#   json.directions recipe.directions
#   json.chef recipe.chef
#   json.image_url recipe.image_url
#   json.prep_time recipe.prep_time
# end

puts "What product id would you like to remove?"

product_id = gets.chomp

response = Unirest.deleted ("url").body
puts JSON.pretty pretty_generate(response)
