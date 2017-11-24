# frozen_string_literal: true

module ApplicationHelper
  def boostrap_class_for(alert)
    {
      success: 'alert-success', error: 'alert-danger', notice: 'alert-success', warning: 'alert-warning',
      danger: 'alert-danger', alert: 'alert-danger'
    }[alert.to_sym]
  end

  def markdown(text)
    options = {
      no_styles: true,
      filter_html: true,
      link_attributes: { rel: 'nofollow', target: '_blank' },
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      quote: true,
      underline: true,
      autolink: false,
      superscript: true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    markdown.render(text).html_safe
  end
end
