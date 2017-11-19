# frozen_string_literal: true

require 'administrate/base_dashboard'

class UserDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    accounts: Field::HasMany,
    resources: Field::HasMany,
    email: Field::String,
    password: Field::String,
    full_name: Field::String,
    first_name: Field::String,
    last_name: Field::String,
    biography: Field::String,
    volunteer: Field::Boolean,
    remove_avatar: Field::Boolean,
    avatar: Field::Carrierwave.with_options(
      image_on_index: true
    ),
    slug: Administrate::Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    avatar
    full_name
    email
    accounts
    resources
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    slug
    avatar
    email
    first_name
    last_name
    biography
    volunteer
    created_at
    updated_at
    accounts
    resources
  ].freeze

  FORM_ATTRIBUTES = %i[
    accounts
    resources
    email
    password
    first_name
    last_name
    volunteer
    biography
    avatar
    remove_avatar
  ].freeze

  def display_resource(user)
    user.full_name
  end
end
