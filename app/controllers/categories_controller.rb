class CategoriesController < ApplicationController
	before_action  :set_parents, only: [:index, :show]

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

end

# def show
# 	@items = Item.order("id DESC").limit(6).includes(:photos)
# 	item = Item.find(params[:id])
# 	@item_categories = item.item_categories
# 	#User_id/category_idなどが取れたら別途実装します。
# 	#とりあえず新着アイテムで実装します
# end