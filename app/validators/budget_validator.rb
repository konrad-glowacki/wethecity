# frozen_string_literal: true

class BudgetValidator < ActiveModel::Validator
  def validate(record)
    return unless
      record.collected_budget.present? &&
      record.collected_budget.positive? &&
      (record.required_budget.nil? || record.required_budget.zero?)

    record.errors[:base] << I18n.t('budget_message')
  end
end
