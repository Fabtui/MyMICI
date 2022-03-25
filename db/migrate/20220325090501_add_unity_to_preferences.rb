class AddUnityToPreferences < ActiveRecord::Migration[6.1]
  def change
    add_column :preferences, :unity, :string
  end
end
