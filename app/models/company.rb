# frozen_string_literal: true

class Company < Account
  def self.model_name
    Account.model_name
  end
end
