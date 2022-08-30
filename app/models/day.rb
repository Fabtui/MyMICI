class Day < ApplicationRecord
  validates :date, presence: true, uniqueness: true
  validates :comment, length: {maximum: 120}, allow_blank: true
  has_many :pooh
  belongs_to :user
  has_many :meals

  def total(key)
    require 'json'
    total = 0
    ingredients_json = JSON.parse(File.read('./app/data/ingredients-json.json'))
    self.meals.each do |meal|
      meal.ingredients.each do |ingredient|
        ingredient_json = (ingredients_json.select { |c| c['name'] == ingredient.name }).first
        total += (ingredient_json[key].to_i * ingredient.meal_ingredients.find_by_meal_id(meal.id).quantity / 100)
      end
    end
    total.round
  end

  def update(col, value)
    raise
  end
  

  CATEGORIES = [
    'energykj',
    'energykcal',
    'energyfibrekj',
    'energyfibrekcal',
    'eau',
    'proteinesjones',
    'proteines',
    'glucides',
    'lipides',
    'sucres',
    'fructose',
    'galactos',
    'glucose',
    'lactose',
    'maltose',
    'saccharose',
    'amidon',
    'fibres',
    'polyols',
    'cendres',
    'alcool',
    'acideorganiques',
    'agsatures',
    'agmonoinsature',
    'agpolyinsature',
    'agbutyrique',
    'agcaproique',
    'agcaprylique',
    'agcaprique',
    'aglaurique',
    'agmyristique',
    'agpalmitique',
    'agstearique',
    'agoleique',
    'aglinoeique',
    'agalphalinolenique',
    'agarachidoneique',
    'ageap',
    'agdha',
    'cholesterole',
    'sel',
    'calcium',
    'chlorure',
    'cuivre',
    'fer',
    'iode',
    'magnesium',
    'manganese',
    'phosphore',
    'potassium',
    'selenium',
    'sodium',
    'zinc',
    'retinol',
    'betacarotene',
    'vitamineD',
    'vitamineE',
    'vitamineK1',
    'vitamineK2',
    'vitamineC',
    'vitamineB1',
    'vitamineB5',
    'vitamineB6',
    'vitamineB12'
  ]

end
