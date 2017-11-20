class CreateJoinTableAccountResource < ActiveRecord::Migration[5.1]
  def change
    create_join_table :accounts, :resources do |t|
      t.index [:account_id, :resource_id], unique: true
    end
  end
end
