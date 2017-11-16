class CreateFounders < ActiveRecord::Migration[5.1]
  def change
    create_table :founders do |t|
      t.references :project, null: false, foreign_key: true
      t.references :member, polymorphic: true, null: false
      t.integer :role, null: false
      t.timestamps

      t.index [:member_id, :member_type, :project_id], unique: true
    end
  end
end
