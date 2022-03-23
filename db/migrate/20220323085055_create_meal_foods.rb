class CreateMealFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :meal_foods do |t|
      t.references :food, null: false, foreign_key: true
      t.references :meal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
