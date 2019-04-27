class CategoriesController < ApplicationController
	before_action  :set_parents, only: [:index, :show]
	before_action  :set_search_items

	def index
	  @parents = Category.all.order("id ASC").limit(13)
	end

	def show
	  @categories = Category.find(params[:id])
	  category = Category.find(params[:id])
	  @item_categories = category.item_categories
	end

	def set_parents
    @parents = Category.all.order("id ASC").limit(13)
  end

	def category_search
	  @parents = Category.find(params[:id])
	  @childrens = @parents.children
      respond_to do |format|
        format.html
        format.json
      end
	end

	def grandchild_search
	  @childrens = Category.find(params[:id])
	  @grandchilds = @childrens.children
	    respond_to do |format|
        format.html
        format.json
      end
    end
end

# def show
# 	@items = Item.order("id DESC").limit(6).includes(:photos)
# 	item = Item.find(params[:id])
# 	@item_categories = item.item_categories
# 	#User_id/category_idなどが取れたら別途実装します。
# 	#とりあえず新着アイテムで実装します
# end

private
def set_search_items
	@search = Item.ransack(params[:q])
	@search_items = @search.result.order("id DESC").page(params[:page]).per(15)
end