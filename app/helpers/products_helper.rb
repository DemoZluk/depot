#encoding: utf-8
module ProductsHelper
  def link_to_product product, html_options = {}, query = nil
    link_to highlight(product.title, query), show_product_path(gid: product.group.permalink, id: product.permalink, q: params[:q]), html_options
  end

  def plant_size_url product
    height = product.values.find_by(property_id: 16).value.to_i.abs
    url = case height
    when 0...10
      'plant-size-1.png'
    when 10...20
      'plant-size-2.png'
    when 20..30
      'plant-size-3.png'
    else
      'plant-size-4.png'
    end
  end
end
