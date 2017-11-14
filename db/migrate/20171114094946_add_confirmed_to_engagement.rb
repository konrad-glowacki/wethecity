class AddConfirmedToEngagement < ActiveRecord::Migration[5.1]
  def change
    add_column :engagements, :confirmed, :boolean, default: false, null: false
  end
end
