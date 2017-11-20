# frozen_string_literal: true

class ProjectDecorator < Draper::Decorator
  delegate_all

  def image_src
    object.images.empty? ? 'projects/default_thumb.jpeg' : object.images.first.medium.url
  end
end
