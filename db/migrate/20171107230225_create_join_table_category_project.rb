class CreateJoinTableCategoryProject < ActiveRecord::Migration[5.1]
  def change
    create_join_table :categories, :projects do |t|
      t.index [:category_id, :project_id], unique: true
    end
  end
end
