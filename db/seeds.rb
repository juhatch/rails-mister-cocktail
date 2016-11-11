# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cocktail.destroy_all

Cocktail.create(name: "mojito")
Cocktail.create(name: "Long Island")
Cocktail.create(name: "sex on the beach")


Ingredient.destroy_all

url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = JSON.parse(open(url).read)["drinks"]
ingredients.map! { |ingredient| { name: ingredient["strIngredient1"] } }
Ingredient.create(ingredients)
