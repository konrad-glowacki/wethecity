# frozen_string_literal: true

class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.string :avatar
      t.string :type, null: false
      t.json :websites
      t.string :address, null: false
      t.string :phone_number
      t.string :email, null: false

      t.timestamps
    end
  end
end
