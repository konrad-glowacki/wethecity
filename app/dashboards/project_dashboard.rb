# frozen_string_literal: true

require 'administrate/base_dashboard'

class ProjectDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    categories: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    active: Field::Boolean,
    video_url: Field::String,
    description_html: Field::Text,
    images: Field::Carrierwave.with_options(
      image: :thumb,
      multiple: true,
      image_on_index: true
    ),
    finish_on: Field::DatePicker,
    location: Field::String,
    latitude: Field::Number.with_options(decimals: 2),
    longitude: Field::Number.with_options(decimals: 2),
    required_budget: Field::Number.with_options(decimals: 2),
    collected_budget: Field::Number.with_options(decimals: 2),
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    categories
    name
    location
    finish_on
    active
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    categories
    name
    active
    video_url
    description_html
    images
    finish_on
    location
    required_budget
    collected_budget
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    categories
    name
    active
    video_url
    description_html
    images
    finish_on
    location
    required_budget
    collected_budget
  ].freeze

  def display_resource(project)
    project.name
  end

  def permitted_attributes
    super - [:images] + [{ images: [] }]
  end
end
