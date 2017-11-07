class AddDeleteAtToProjectCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :project_categories, :deleted_at, :datetime
    add_index :project_categories, :deleted_at

    remove_index :project_categories, :name
    add_index :project_categories, :name, where: 'deleted_at IS NULL', unique: true
  end
end
