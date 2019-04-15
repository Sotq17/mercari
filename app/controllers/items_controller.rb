class ItemsController < ApplicationController
  before_action  :item_find, except: [:index, :search, :new, :create]

	def index
		@items = Item.order("id DESC").limit(4).includes(:photos)
	end

	def search
		@items = Item.where('name LIKE(?)', "%#{params[:keyword]}%").order("id DESC").page(params[:page]).per(15)
			if params[:keyword] == ""
				redirect_to '/items/search?utf8=✓&keyword=+++'
			end
			if @items.count == 0
				@all_items = Item.limit(25).order("id DESC")
			end
	end

	def show
		@items = Item.order("id DESC").limit(6).includes(:photos)
		#User_id/category_idなどが取れたら別途実装します。
		#とりあえず新着アイテムで実装します
	end

  def new
  	@item = Item.new
    @item.photos.build
  end

  def create
  	@item = Item.new(create_params)
      if @item.save
        redirect_to root_path
      else
        redirect_to new_item_path
      end
  end

  def edit
    @item = Item.find(params[:id])
  end


  def update
    @item.update(create_params)
      redirect_to root_path
  end

  def buy
  end

  def item_find
    @item = Item.find(params[:id])
  end

  private
  def create_params
      params.require(:item).permit(:name, :description, :price, :size_id, :state_id, :fee_side_id, :way_id, :region_id, :day_id, photos_attributes: [:id, :image, :_destroy])
  end
end
