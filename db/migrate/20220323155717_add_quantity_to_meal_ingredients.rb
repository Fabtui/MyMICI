class AddQuantityToMealIngredients < ActiveRecord::Migration[6.1]
  def change
    add_column :meal_ingredients, :quantity, :float
  end
end
