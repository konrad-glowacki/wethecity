# frozen_string_literal: true

class Resource < ApplicationRecord
  enum kind: %i[skill asset]
end
