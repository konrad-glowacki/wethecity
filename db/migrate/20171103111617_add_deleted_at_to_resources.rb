class AddDeletedAtToResources < ActiveRecord::Migration[5.1]
  def change
    add_column :resources, :deleted_at, :datetime
    add_index :resources, :deleted_at
  end
end
