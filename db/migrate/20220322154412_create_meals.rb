class CreateMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :meals do |t|
      t.references :meal_type, foreign_key: true
      t.references :meal, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
