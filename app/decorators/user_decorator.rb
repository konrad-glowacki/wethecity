# frozen_string_literal: false

class UserDecorator < Draper::Decorator
  delegate_all

  def member_since
    h.t('.member_since', date: l(object.created_at, format: :dmy))
  end

  def phone_and_email
    ''.tap do |phone_email|
      phone_email << phone(object)
      phone_email << separator(object)
      phone_email << email(object)
    end
  end

  private

  def phone(object)
    object.phone_number ? h.t('.phone_number', phone_number: object.phone_number) : ''
  end

  def separator(object)
    object.phone_number && object.email ? ' | ' : ''
  end

  def email(object)
    object.email ? object.email : ''
  end
end
