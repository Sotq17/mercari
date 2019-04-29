  class UsersController < ApplicationController
    before_action  :set_search_items, only: [:show]
    before_action  :set_parents, only: [:show]
    def show
    end

    private
    def set_search_items
      @search = Item.ransack(params[:q])
      @search_items = @search.result.order("id DESC").page(params[:page]).per(15)
    end


    def set_parents
      @parents = Category.all.order("id ASC").limit(13)
    end
  end
