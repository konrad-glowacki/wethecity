# frozen_string_literal: true

module ApplicationHelper
  def boostrap_class_for(alert)
    {
      success: 'alert-success', error: 'alert-danger', notice: 'alert-success', warning: 'alert-warning',
      danger: 'alert-danger', alert: 'alert-danger'
    }[alert.to_sym]
  end
end
