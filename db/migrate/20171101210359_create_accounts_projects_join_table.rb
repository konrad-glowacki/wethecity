# frozen_string_literal: false

class CreateAccountsProjectsJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :accounts, :projects do |t|
      t.integer :account_id, null: false, foreign_key: true
      t.integer :project_id, null: false, foreign_key: true

      t.datetime :created_at, null: false
    end
    add_index :accounts_projects, %i[account_id project_id], unique: true
  end
end
