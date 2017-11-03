class CreateProjectsResourcesJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :projects, :resources do |t|
      t.references :project, null: false
      t.references :resource, null: false
      t.text :description, limit: 255
      t.float :quantity
      t.references :provider, null: false, polymorphic: true
      t.datetime :provided_at, null: false
    end
    add_index :projects_resources, %i[project_id resource_id provider_id provider_type],
              name: 'index_projects_resources_unique_provider', unique: true
  end
end
