class StoreController < ApplicationController

  def index
    @categories = Category.all
    @available_items = Item.available_items
  end

end
