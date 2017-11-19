# frozen_string_literal: true

class ProjectDecorator < Draper::Decorator
  delegate_all

  def image_src
    object.images.empty? ? 'default_project_image.jpeg' : object.images.first.medium.url
  end
end
