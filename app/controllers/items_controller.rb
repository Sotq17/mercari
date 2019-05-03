class ItemsController < ApplicationController
  before_action  :item_find, except: [:index, :search, :new, :create, :show]
  before_action  :set_parents, only: [:index, :show, :search]

  before_action  :set_search_items, only: [:search, :show, :index,]
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.order("id DESC").limit(4).includes(:photos)
    @parents = Category.all.order("id ASC").limit(13)
    @pickup_categories = Category.all.order("id ASC").limit(4)
  end

  def search
    if params[:q] == {"name_cont": ""}
      @search_items = Item.none
    end
    if @search_items.count == 0
      @all_items = Item.limit(25).order("id DESC")
    end
    @parents = Category.all.order("id ASC").limit(13)
 end

 def show
    @items = Item.order("id DESC").limit(6).includes(:photos)
    @item = Item.find(params[:id])
    @item_categories = @item.item_categories
    @user = Item.find(params[:id]).user
    @users = Item.where(user_id: @user.id)
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
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
    @items = @item.photos.where(item_id: [params[:id]])
    @photo = @item.photos.length
    @categories = @item.item_categories.where(item_id: [params[:id]])
    @length = 10 - @items.length
    @length.times{@items.build}
    @parents = Category.all.order("id ASC").limit(13)
    3.times{@categories.build}
  end


  def update
    if @item.user_id == current_user.id
      @item.update(update_params)
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def buy
    render template: "purchases/index"
  end


  private
  def create_params
      params.require(:item).permit(:name, :description, :price, :size_id, :state_id, :fee_side_id, :way_id, :region_id, :day_id, :category_ids, photos_attributes: [:id, :image, :_destroy]).merge(user_id: current_user.id)
  end

  def update_params
      params.require(:item).permit(:name, :description, :price, :size_id, :state_id, :fee_side_id, :way_id, :region_id, :day_id, photos_attributes: [:id, :image, :_destroy]).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def set_parents
    @parents = Category.all.order("id ASC").limit(13)
  end

  def set_search_items
    @search = Item.ransack(params[:q])
    # binding.pry
    # @result = @search.category
    # @results = Item.where(category_id: @result.id)
    @search_items = @search.result.includes(:categories).order("id DESC").page(params[:page]).per(15)
    # @search_items = @search.result.order("created_at DESC").page(params[:page]).per(15)
  end
end
