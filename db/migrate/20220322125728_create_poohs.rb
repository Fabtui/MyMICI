class CreatePoohs < ActiveRecord::Migration[6.1]
  def change
    create_table :poohs do |t|
      t.references :day, null: false, foreign_key: true
      t.boolean :blood
      t.integer :rate

      t.timestamps
    end
  end
end
