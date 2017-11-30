# frozen_string_literal: false

class UserDecorator < Draper::Decorator
  delegate_all

  def member_since
    h.t('.member_since', date: l(object.created_at, format: :dmy))
  end
end
