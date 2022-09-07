class AddCrisisRefToDays < ActiveRecord::Migration[6.1]
  def change
    add_reference :days, :crisis, foreign_key: true
  end
end
