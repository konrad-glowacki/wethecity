# frozen_string_literal: false

class UserDecorator < Draper::Decorator
  delegate_all

  def member_since
    h.t('.member_since', date: l(object.created_at, format: :dmy))
  end

  def phone_and_email
    ''.tap do |phone_email|
      phone_email << h.t('.phone_number', phone_number: object.phone_number) if object.phone_number
      phone_email << ' | ' if object.phone_number
      phone_email << object.email
    end
  end
end
