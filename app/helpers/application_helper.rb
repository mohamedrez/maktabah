# frozen_string_literal: true

module ApplicationHelper
  def direction
    I18n.locale == :ar ? 'rtl' : 'ltr'
  end
end
