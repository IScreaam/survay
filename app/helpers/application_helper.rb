module ApplicationHelper
  def active_item_class(item)
    return 'active' if params[:controller] == item
    ''
  end

  BOOTSTRAP_FLASH_MSG = {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
  }

  def bootstrap_class_for(flash_type)
    BOOTSTRAP_FLASH_MSG.fetch(flash_type, flash_type.to_s)
  end

  def flash_messages(opts = {})

    flash.each do |msg_type, message|

      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type.try(:to_sym))} fade in") do
               concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
               concat message
             end)
    end
    nil
  end
end
