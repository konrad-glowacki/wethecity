class RemoveProvidedAtFromEngagements < ActiveRecord::Migration[5.1]
  def change
    remove_column :engagements, :provided_at, :datatime
  end
end
