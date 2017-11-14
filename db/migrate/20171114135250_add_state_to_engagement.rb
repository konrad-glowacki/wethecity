class AddStateToEngagement < ActiveRecord::Migration[5.1]
  def change
    add_column :engagements, :state, :integer, default: Engagement.states[:pending]
  end
end
