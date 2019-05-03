  class UsersController < ApplicationController
    before_action  :set_search_items
    before_action  :set_parents
    before_action  :user_find
    before_action  :cardwhere

    def show
    end

    def signout
    end

    def edit
    end

    def exhibit
      @useritem = @user.saling_items
    end

    def sold
    end

    def purchase
    end

    private
    def set_search_items
      @search = Item.ransack(params[:q])
      @search_items = @search.result.order("created_at DESC").page(params[:page]).per(15)
    end

    def user_find
      @user = User.find(current_user.id)
    end

    def cardwhere
      @card = Card.where(user_id: current_user.id)
    end


    def set_parents
      @parents = Category.all.order("id ASC").limit(13)
    end
  end
