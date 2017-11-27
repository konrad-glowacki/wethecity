# frozen_string_literal: true

require 'administrate/base_dashboard'

class AccountDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Administrate::Field::Number,
    resources: Field::HasMany,
    users: Administrate::Field::HasMany,
    name: Administrate::Field::String,
    email: Administrate::Field::String,
    facebook_url: Administrate::Field::String.with_options(searchable: false),
    website_url: Administrate::Field::String.with_options(searchable: false),
    linkedin_url: Administrate::Field::String.with_options(searchable: false),
    address: Administrate::Field::String,
    slug: Administrate::Field::String,
    phone_number: Administrate::Field::String,
    remove_logo: Administrate::Field::Boolean,
    logo: Administrate::Field::Carrierwave.with_options(
      image_on_index: true
    ),
    description: Field::SimpleMarkdown,
    created_at: Administrate::Field::DateTime,
    updated_at: Administrate::Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    logo
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
    logo
    email
    facebook_url
    website_url
    linkedin_url
    address
    phone_number
    description
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
    facebook_url
    website_url
    linkedin_url
    logo
    remove_logo
    description
  ].freeze

  def display_resource(account)
    "#{account.class.name} ##{account.name}"
  end
end
