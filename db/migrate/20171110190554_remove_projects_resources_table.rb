class RemoveProjectsResourcesTable < ActiveRecord::Migration[5.1]
  def change
    drop_table(:projects_resources)
  end
end
