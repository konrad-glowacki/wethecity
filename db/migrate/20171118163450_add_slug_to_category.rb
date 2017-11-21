class AddSlugToCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :slug, :string
    add_index :categories, :slug, where: 'deleted_at IS NULL', unique: true
  end
end
