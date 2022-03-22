class CreateDays < ActiveRecord::Migration[6.1]
  def change
    create_table :days do |t|
      t.references :user, null: false, foreign_key: true
      t.text :comment
      t.date :date
      t.integer :pain_rate

      t.timestamps
    end
  end
end
