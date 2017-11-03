# frozen_string_literal: true

class CreateProjectsUsersJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :projects, :users do |t|
      t.integer :project_id, null: false, foreign_key: true
      t.integer :user_id, null: false, foreign_key: true
      t.string :role, null: false
      t.datetime :created_at, null: false
    end
    add_index :projects_users, %i[project_id user_id], unique: true
  end
end
