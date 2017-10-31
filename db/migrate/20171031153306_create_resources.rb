# frozen_string_literal: true

class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.string :name, null: false, index: true, unique: true
      t.integer :kind, null: false

      t.timestamps
    end
  end
end
