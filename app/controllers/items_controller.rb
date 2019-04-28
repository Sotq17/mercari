class ItemsController < ApplicationController
  before_action  :item_find, except: [:index, :search, :new, :create]
  before_action  :set_parents, only: [:index, :show, :search]

  before_action  :set_search_items
  before_action :authenticate_user!, only: :new

  def index
    @items = Item.order("id DESC").limit(4).includes(:photos)
    @parents = Category.all.order("id ASC").limit(13)
 end

  def search
    if params[:q] == {"name_cont": ""}
      @search_items = Item.none
    end
    if @search_items.count == 0
      @all_items = Item.limit(25).order("id DESC")
    end
    @parents = Category.all.order("id ASC").limit(13)
    # binding.pry
 end

 def show
    @items = Item.order("id DESC").limit(6).includes(:photos)
    item = Item.find(params[:id])
    @item_categories = item.item_categories
  #User_idが取れたら別途実装します。
 end

  def new
   @item = Item.new
    10.times{@item.photos.build}
    @parents = Category.all.order("id ASC").limit(13)
    3.times{@item.item_categories.build}
    @item.item_categories.build
  end

  def create
   @item = Item.new(create_params)
      if @item.save
        redirect_to root_path
      else
        redirect_to new_item_path
      end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def edit
    @items = @item.photos.where(item_id: [params[:id]])
    10.times{@item.photos.build}
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
      params.require(:item).permit(:name, :description, :price, :size_id, :state_id, :fee_side_id, :way_id, :region_id, :day_id, :category_ids, photos_attributes: [:image]).merge(user_id: current_user.id)
  end

  def set_parents
    @parents = Category.all.order("id ASC").limit(13)
  end

  def set_search_items
    @search = Item.ransack(params[:q])
    @search_items = @search.result.includes(:categories).order("id DESC").page(params[:page]).per(15)
  end
end
