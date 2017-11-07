class AddDeleteAtToCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :deleted_at, :datetime
    add_index :categories, :deleted_at

    remove_index :categories, :name
    add_index :categories, :name, where: 'deleted_at IS NULL', unique: true
  end
end
