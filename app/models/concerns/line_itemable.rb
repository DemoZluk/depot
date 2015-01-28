require 'active_support/concern'

module LineItemable
  extend ActiveSupport::Concern

  included do
    has_many :line_items, dependent: :destroy
  end

  def total_price
    line_items.to_a.sum{|li| li.price * li.quantity}.to_i
  end

  def discount_price
    if try(:user) || try(:discount)
      dc = [try(:discount).to_f, try(:user).try(:discount).to_f].max
      total_price * (1 - dc/100)
    else
      total_price
    end.to_i
  end
end