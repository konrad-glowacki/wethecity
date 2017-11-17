class AddSlugToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :slug, :string
    add_index :projects, :slug
  end
end
