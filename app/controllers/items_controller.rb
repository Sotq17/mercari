class ItemsController < ApplicationController

    def index
        @items = Item.order("id ASC").limit(4).includes(:photos)
    end

    def search
				@items = Item.where('name LIKE(?)', "%#{params[:keyword]}%").limit(24).order("id ASC")
				@all_item= Item.all
				if @items.count == 0
        	@items = Item.all.order("id ASC").limit(24)
        end
    end
end