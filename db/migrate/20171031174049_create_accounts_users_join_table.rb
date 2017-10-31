class CreateAccountsUsersJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :accounts, :users do |t|
      t.integer :account_id, null: false, foreign_key: true
      t.integer :user_id, null: false, foreign_key: true
    end
    add_index :accounts_users, %i[account_id user_id], unique: true
  end
end
