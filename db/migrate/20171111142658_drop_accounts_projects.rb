class DropAccountsProjects < ActiveRecord::Migration[5.1]
  def change
    drop_table :accounts_projects
  end
end
