module DiariesHelper
  def enum_radio_buttons(form, field, enum_values)
    enum_values.keys.map do |key|
      content_tag(:div, class: 'form-check form-check-inline') do
        form.radio_button(field, key, class: 'form-check-input') +
        form.label("#{field}_#{key}", class: 'form-check-label fs-3') do
          enum_icon(key)
        end
      end
    end.join.html_safe
  end

  def enum_icon(key)
    case key
    when 'excellent'
      content_tag(:i, '', class: 'bi bi-emoji-laughing fs-3')
    when 'good'
      content_tag(:i, '', class: 'bi bi-emoji-smile fs-3')
    when 'poor'
      content_tag(:i, '', class: 'bi bi-emoji-dizzy fs-3')
    else
      ''
    end
  end
end
