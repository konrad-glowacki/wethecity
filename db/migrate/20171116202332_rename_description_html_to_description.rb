class RenameDescriptionHtmlToDescription < ActiveRecord::Migration[5.1]
  def change
    rename_column :projects, :description_html, :description
  end
end
