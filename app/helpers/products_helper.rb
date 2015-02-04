#encoding: utf-8
module ProductsHelper
  def link_to_product product, html_options = {}, query = nil
    link_to highlight(product.title, query), show_product_path(gid: product.group.permalink, id: product.permalink, q: params[:q]), html_options
  end

  def plant_size_url product
    height = product.values.find_by(property_id: 16).value.to_i
    case height
    when 0..10
      url = 'plant-size-1.png'
    when 11..20
      url = 'plant-size-2.png'
    when 21..30
      url = 'plant-size-3.png'
    else
      url = 'plant-size-4.png'
    end
  end
end
