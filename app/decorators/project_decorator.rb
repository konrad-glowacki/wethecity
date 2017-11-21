# frozen_string_literal: true

class ProjectDecorator < Draper::Decorator
  delegate_all

  def image_src
    object.images.empty? ? 'projects/default_thumb.jpeg' : object.images.first.medium.url
  end

  def budget_completed_percentage
    (object.collected_budget / object.required_budget * 100).round(0)
  end
end
