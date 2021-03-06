class StoreController < ApplicationController
  include CurrentCart
  include CurrentSettings
  include CurrentProducts

  before_action :change_user_prefs, :set_products, :set_cart
  skip_before_action :authenticate_user!

  def visit_counter
    session[:counter] = (session[:counter]||0)+1
  end

  def index
    @next = params[:next].presence
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

    def set_products
      products = Product.with_price.order(@order_by || 'title')
      current_list_of products
    end
end
