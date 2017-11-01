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
    accounts: Field::HasMany,
    users: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    active: Field::Boolean,
    video_url: Field::String,
    description_html: Field::Text,
    images: Field::String.with_options(searchable: false),
    finish_on: Field::DateTime,
    location: Field::String,
    latitude: Field::Number.with_options(decimals: 2),
    longitude: Field::Number.with_options(decimals: 2),
    city: Field::String,
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
    accounts
    users
    id
    name
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    accounts
    users
    id
    name
    active
    video_url
    description_html
    images
    finish_on
    location
    latitude
    longitude
    city
    required_budget
    collected_budget
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    accounts
    users
    name
    active
    video_url
    description_html
    images
    finish_on
    location
    latitude
    longitude
    city
    required_budget
    collected_budget
  ].freeze

  # Overwrite this method to customize how projects are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(project)
  #   "Project ##{project.id}"
  # end
end
