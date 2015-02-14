module MenuItemsHelper
  def menu_item(name, options = nil, condition = true, html_options = {})
    if condition
      render 'shared/menu_item', name: name, options: options, html_options: html_options
      # c = 'btn-gray'
      # c << ' current-page' if options == request.path
      # if options.present?
      #   link_to(name, options, html_options.merge(class: c))
      # else
      #   content_tag(:span, name, html_options.merge(class: c))
      # end
    end
  end
end
