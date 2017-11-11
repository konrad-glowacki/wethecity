class DropProjectsUsers < ActiveRecord::Migration[5.1]
  def change
    drop_table :projects_users
  end
end
