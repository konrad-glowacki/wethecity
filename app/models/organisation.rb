# frozen_string_literal: true

class Organisation < Account
  def self.model_name
    Account.model_name
  end
end
