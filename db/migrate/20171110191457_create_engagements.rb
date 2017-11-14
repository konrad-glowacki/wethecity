class CreateEngagements < ActiveRecord::Migration[5.1]
  def change
    create_table :engagements do |t|
      t.references :project, foreign_key: true, null: false
      t.references :resource, foreign_key: true, null: false
      t.text :description
      t.float :quantity
      t.string :provider_type, null: false
      t.bigint :provider_id, null: false
      t.datetime :provided_at, null: false

      t.timestamps
    end

    add_index(
      :engagements,
      [:project_id, :resource_id, :provider_id, :provider_type],
      unique: true, name: 'index_projects_resources_unique_provider'
    )

    add_index(:engagements, [:project_id, :provider_type])
  end
end
