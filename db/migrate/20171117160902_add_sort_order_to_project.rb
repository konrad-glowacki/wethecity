class AddSortOrderToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :sort_order, :integer
  end
end
