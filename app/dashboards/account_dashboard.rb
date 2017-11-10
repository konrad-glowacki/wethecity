# frozen_string_literal: true

require 'administrate/base_dashboard'

class AccountDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    users: Field::HasMany,
    name: Field::String,
    email: Field::String,
    type: Field::Select.with_options(collection: Account.types),
    websites: Field::String.with_options(searchable: false),
    address: Field::String,
    phone_number: Field::String,
    remove_avatar: Field::Boolean,
    avatar: Field::Carrierwave.with_options(
      image: :thumb,
      multiple: false,
      image_on_index: true
    ),
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    avatar
    name
    type
    address
    users
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    name
    address
    avatar
    email
    type
    websites
    address
    phone_number
    users
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    users
    name
    email
    type
    websites
    address
    phone_number
    avatar
    remove_avatar
  ].freeze

  def display_resource(account)
    "#{account.class.name} ##{account.name}"
  end
end
