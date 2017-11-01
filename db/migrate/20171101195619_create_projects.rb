class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.boolean :active, null: false, default: false
      t.string :video_url
      t.text :description_html, null: false
      t.json :images
      t.date :finish_on, null: false
      t.string :location, null: false
      t.float :latitude
      t.float :longitude
      t.string :city, null: false, default: 'krakow'
      t.float :required_budget
      t.float :collected_budget

      t.timestamps
    end
  end
end
