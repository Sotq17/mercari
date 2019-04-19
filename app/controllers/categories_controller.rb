class CategoriesController < ApplicationController
	def index
		@parents = Category.all.order("id ASC").limit(13)
	end

	def show
		@categories = Category.find(params[:id])
	end
end
