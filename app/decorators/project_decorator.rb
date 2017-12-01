# frozen_string_literal: true

class ProjectDecorator < Draper::Decorator
  delegate_all

  def default_image(version)
    object.images.empty? ? "projects/default_#{version}.jpg" : object.images.first.medium.url
  end

  def budget_completed_percentage
    return nil unless budget_completed_percentage?

    (object.collected_budget / object.required_budget * 100).to_i
  end

  def budget_completed_percentage?
    object.required_budget.present? && !object.required_budget.zero? && object.collected_budget.present?
  end

  def required_budget_format
    h.t('.need', required_budget: object.required_budget)
  end
end
