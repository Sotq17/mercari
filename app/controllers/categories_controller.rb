class CategoriesController < ApplicationController
	before_action  :set_parents, only: [:index, :show]
	before_action  :set_search_items, only: [:index, :show]

	def index
	  @parents = Category.all.order("id ASC").limit(13)
	end

	def show
		@categories = Category.find(params[:id])
		@search_categories = @categories.subtree
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

private
def set_search_items
	@search = Item.ransack(params[:q])
	@search_items = @search.result.order("created_at DESC").page(params[:page]).per(15)
end