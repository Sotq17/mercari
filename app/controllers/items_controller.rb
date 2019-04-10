class ItemsController < ApplicationController

    def index
        @items = Item.order("id DESC").limit(4).includes(:photos)
    end
end
