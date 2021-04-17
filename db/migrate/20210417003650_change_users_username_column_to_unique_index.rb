class ChangeUsersUsernameColumnToUniqueIndex < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :username, :string, unique: true
  end
end
