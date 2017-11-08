class ChangeResourcesIndexes < ActiveRecord::Migration[5.1]
  def change
    remove_index :resources, :name
    add_index :resources, :name, where: 'deleted_at IS NULL', unique: true
  end
end
