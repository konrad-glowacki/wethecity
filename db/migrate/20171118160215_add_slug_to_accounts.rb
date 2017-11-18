class AddSlugToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :slug, :string
    add_index :accounts, :slug, where: 'deleted_at IS NULL', unique: true
  end
end
