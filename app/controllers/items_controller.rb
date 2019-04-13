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

    def new
    	@item = Item.new
        @item.photos.build
    end

    def create
    	@item = Item.new(create_params)
        if @item.save
          redirect_to controller: :items, action: :index
        else
          redirect_to controller: :items, action: :new
        end
    end

    private
    def create_params
        params.require(:item).permit(:name, :description, :price, :size_id, :state_id, :fee_side_id, :method_id, :region_id, :date_id, photos_attributes: [:id, :image, :_destroy])
    end
end