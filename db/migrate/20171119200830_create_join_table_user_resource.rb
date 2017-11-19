class CreateJoinTableUserResource < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :resources do |t|
      t.index [:user_id, :resource_id], unique: true
    end
  end
end
