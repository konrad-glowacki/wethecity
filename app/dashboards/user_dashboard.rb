# frozen_string_literal: true

require 'administrate/base_dashboard'

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    accounts: Field::HasMany,
    avatar: Field::Carrierwave.with_options(
      image: :thumb,
      multiple: false,
      image_on_index: true
    ),
    remove_avatar: Field::Boolean,
    email: Field::String,
    password: Field::String,
    first_name: Field::String,
    last_name: Field::String,
    biography: Field::String,
    volunteer: Field::Boolean
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    avatar
    email
    first_name
    last_name
    biography
    volunteer
    accounts
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    avatar
    email
    first_name
    last_name
    biography
    volunteer
    accounts
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    avatar
    remove_avatar
    email
    password
    first_name
    last_name
    biography
    volunteer
    accounts
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
