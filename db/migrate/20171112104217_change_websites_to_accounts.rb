class ChangeWebsitesToAccounts < ActiveRecord::Migration[5.1]
  def up
    remove_column :accounts, :websites
    add_column :accounts, :facebook_website, :string
    add_column :accounts, :homepage_website, :string
  end

  def down
    remove_column :accounts, :facebook_website
    remove_column :accounts, :homepage_website
    add_column :accounts, :websites, :jsob
  end
end
