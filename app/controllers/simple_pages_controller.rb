class SimplePagesController < ApplicationController
  def index
  end
  def about
  end
  def contact
  end
  def landing_page
    @featured_products = Product.limit(3)
  end
end
