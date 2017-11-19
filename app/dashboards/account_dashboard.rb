# frozen_string_literal: true

require 'administrate/base_dashboard'

class AccountDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Administrate::Field::Number,
    resources: Field::HasMany,
    users: Administrate::Field::HasMany,
    name: Administrate::Field::String,
    email: Administrate::Field::String,
    facebook_website: Administrate::Field::String.with_options(searchable: false),
    homepage_website: Administrate::Field::String.with_options(searchable: false),
    address: Administrate::Field::String,
    slug: Administrate::Field::String,
    phone_number: Administrate::Field::String,
    remove_avatar: Administrate::Field::Boolean,
    avatar: Administrate::Field::Carrierwave.with_options(
      image_on_index: true
    ),
    created_at: Administrate::Field::DateTime,
    updated_at: Administrate::Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    avatar
    name
    address
    users
    resources
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    slug
    name
    address
    avatar
    email
    facebook_website
    homepage_website
    address
    phone_number
    created_at
    updated_at
    users
    resources
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    users
    resources
    name
    email
    address
    phone_number
    facebook_website
    homepage_website
    avatar
    remove_avatar
  ].freeze

  def display_resource(account)
    "#{account.class.name} ##{account.name}"
  end
end
