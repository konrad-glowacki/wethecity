class AddAncestryToProjectCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :project_categories, :ancestry, :string
    add_index :project_categories, :ancestry
  end
end
