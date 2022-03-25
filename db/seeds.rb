# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require_relative '../app/data/categories'

CATEGORIES[5..].each do |category|
  Preference.create!(name: category[0], unity: category[1])
end


MealType.destroy_all

MealType.create!(name: "Petit déjeuner")
MealType.create!(name: "Déjeuner")
MealType.create!(name: "Dîner")
MealType.create!(name: "Encas")
MealType.create!(name: "Apéritif")

def parse_csv
  require "csv"
  CSV.foreach("app/data/Ingredients-data.csv", headers: :first_row) do |row|
    unless Ingredient.find_by_name(row['name']).present?
      ingredient = Ingredient.new
      ingredient.group1 = row['group1']
      ingredient.group2 = row['group2']
      ingredient.group3 = row['group3']
      ingredient.code = row['code']
      ingredient.name = row['name']
      ingredient.energykj = row['energykj'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.energykcal = row['energykcal'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.energyfibrekj = row['energyfibrekj'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.energyfibrekcal = row['energyfibrekcal'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.eau = row['eau'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.proteinesjones = row['proteinesjones'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.proteines = row['proteines'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.glucides = row['glucides'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.lipides = row['lipides'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.sucres = row['sucres'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.fructose = row['fructose'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.galactos = row['galactos'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.glucose = row['glucose'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.lactose = row['lactose'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.maltose = row['maltose'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.saccharose = row['saccharose'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.amidon = row['amidon'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.fibres = row['fibres'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.polyols = row['polyols'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.cendres = row['cendres'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.alcool = row['alcool'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.acideorganiques = row['acideorganiques'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.agsatures = row['Agsatures'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.agmonoinsature = row['Agmonoinsature'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.agpolyinsature = row['Agpolyinsature'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.agbutyrique = row['Agbutyrique'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.agcaproique = row['Agcaproique'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.agcaprylique = row['Agcaprylique'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.agcaprique = row['Agcaprique'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.aglaurique = row['Aglaurique'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.agmyristique = row['Agmyristique'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.agpalmitique = row['Agpalmitique'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.agstearique = row['Agstearique'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.agoleique = row['Agoleique'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.aglinoeique = row['Aglinoeique'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.agalphalinolenique = row['Agalphalinolenique'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.agarachidoneique = row['Agarachidoneique'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.ageap = row['AGEAP'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.agdha = row['AGDHA'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.cholesterole = row['cholesterole'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.sel = row['sel'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.calcium = row['calcium'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.chlorure = row['chlorure'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.cuivre = row['cuivre'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.fer = row['fer'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.iode = row['iode'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.magnesium = row['magnesium'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.manganese = row['manganese'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.phosphore = row['phosphore'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.potassium = row['potassium'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.selenium = row['selenium'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.sodium = row['sodium'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.zinc = row['zinc'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.retinol = row['retinol'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.betacarotene = row['betacarotene'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.vitamineD = row['vitamineD'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.vitamineE = row['vitamineE'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.vitamineK1 = row['vitaminek1'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.vitamineK2 = row['vitaminek2'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.vitamineC = row['vitamineC'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.vitamineB1 = row['vitamineB1'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.vitamineB2 = row['vitamineB2'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.vitamineB3 = row['vitamineB3'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.vitamineB5 = row['vitamineB5'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.vitamineB6 = row['vitamineB6'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.vitamineB9 = row['vitamineB9'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.vitamineB12 = row['vitamineB12'].gsub(',', '.').gsub('> ', '').to_f
      ingredient.save
    end
  end
end

parse_csv

puts "#{Ingredient.count} ingredients created!"
puts "#{MealType.count} meal_types created!"
puts "#{Preference.count} preferences created!"
