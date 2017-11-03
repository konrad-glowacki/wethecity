class ChangeUsersIndexes < ActiveRecord::Migration[5.1]
  def change
    remove_index :users, :confirmation_token
    remove_index :users, :email
    remove_index :users, :location
    remove_index :users, :reset_password_token
    remove_index :users, :unlock_token

    add_index :users, :confirmation_token, unique: true, where: 'deleted_at IS NULL'
    add_index :users, :email, unique: true, where: 'deleted_at IS NULL'
    add_index :users, :location, where: 'deleted_at IS NULL'
    add_index :users, :reset_password_token, unique: true, where: 'deleted_at IS NULL'
    add_index :users, :unlock_token, unique: true, where: 'deleted_at IS NULL'
  end
end
