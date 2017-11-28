class AddFieldsToAccount < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :linkedin_url, :string
    add_column :accounts, :description, :text
  end
end
