# frozen_string_literal: true

require 'administrate/base_dashboard'

class EngagementDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  provider_collection =
    User.all.map { |u| { id: u.id, type: 'User', value: u.full_name } } +
    Account.all.map { |a| { id: a.id, type: a.class.name, value: a.name } }

  ATTRIBUTE_TYPES = {
    project: Field::BelongsTo,
    resource: Field::BelongsTo,
    id: Field::Number,
    description: Field::Text,
    quantity: Field::Number.with_options(decimals: 2),
    provider: Field::Polymorphic.with_options(collection: provider_collection),
    provider_type: Field::String,
    provider_id: Field::Number,
    state: Field::Select.with_options(collection: Engagement.states.keys),
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    project
    resource
    provider
    state
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    project
    resource
    id
    description
    quantity
    provider
    state
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    project
    resource
    description
    quantity
    state
    provider
  ].freeze

  # Overwrite this method to customize how engagements are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(engagement)
  #   "Engagement ##{engagement.id}"
  # end

  def permitted_attributes
    super + %i[provider_id provider_type]
  end
end
