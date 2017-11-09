# frozen_string_literal: true

require 'administrate/field/base'

class MultipleSelectField < Administrate::Field::Select
  def selectable_options
    attribute.to_s.classify.constantize.all
  end

  def to_s
    data
  end

  def self.permitted_attribute(attribute)
    { attribute.to_sym => [] }
  end

  def permitted_attribute
    self.class.permitted_attribute(attribute)
  end
end
