class StoreController < ApplicationController
  include SessionData
  before_action :set_count, only: [:index]
  def index
  	@products = Product.order(:title)
  end
end
