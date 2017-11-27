class RenameFieldsInAccount < ActiveRecord::Migration[5.1]
  def change
    rename_column :accounts, :avatar, :logo
    rename_column :accounts, :facebook_website, :facebook_url
    rename_column :accounts, :homepage_website, :website_url
  end
end
