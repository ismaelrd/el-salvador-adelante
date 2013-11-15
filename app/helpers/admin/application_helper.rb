module Admin::ApplicationHelper

  # draw flash messages
  def flash_messages
    [:notice, :error, :alert].map do |level|
      if flash[level].present?
        content_tag(:div, class: "alert #{flash_class(level)} alert-dismissable") do
          concat content_tag(:button, raw("&times;"), type: 'button', class: 'close', data: { dismiss: 'alert'}, 'aria-hidden' => 'true')
          concat flash[level]
        end
      end
    end.join.html_safe
  end

  def flash_class(level)
    case level
      when :notice then "alert-success"
      when :error then "alert-danger"
      when :alert then "alert-warning"
    end
  end

  def draw_errors(object)
    if object.errors.full_messages.any?
      content_tag(:div, class: "alert alert-warning alert-dismissable") do
        content_tag(:ul) do
          object.errors.full_messages.map do |message|
            content_tag(:li, message)
          end.join().html_safe
        end
      end
    end
  end

end
