class AddNicknameMailBirthdayToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :birthday, :date
    add_column :users, :nickname, :string
  end
end
