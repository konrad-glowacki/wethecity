class ChangeBudgetFieldsForProject < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:projects, :required_budget, from: nil, to: 0)
    change_column_default(:projects, :collected_budget, from: nil, to: 0)
  end
end
