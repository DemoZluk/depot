module LineItemsHelper
  def make_discount price, discount
    (price * (1 - discount.to_f/100)).to_i
  end
end
