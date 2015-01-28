class Cart < ActiveRecord::Base
  include LineItemable

  belongs_to :user

  scope :not_empty, -> { joins{line_items}.group{id} }

  def add_product(product_id, amount)
    current_item = line_items.find_by(product_id: product_id)
    if current_item
      current_item.quantity += amount
    else
      current_item = line_items.build(product_id: product_id, quantity: amount)
      current_item.price = Product.find(product_id).price
    end
    current_item
  end

  def self.destroy_abandoned_carts(time = 1.day)
    time = time.ago
    carts = Cart.select{id}.joins{line_items.outer}.where{(updated_at < time)}.group{id}.having{count(line_items.id) == 0}.try(:destroy_all)
    puts "Destroyed empty carts, that are older than #{time}"
    Cart.where{(updated_at < 1.month.ago)}.try(:destroy_all)
    puts "Destroyed all carts, that are older than #{1.month.ago}"
  end
end
