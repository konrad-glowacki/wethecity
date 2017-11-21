class AddSlugToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :slug, :string
    add_index :users, :slug, where: 'deleted_at IS NULL', unique: true
  end
end
