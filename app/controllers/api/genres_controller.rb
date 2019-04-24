class Api::GenresController < ApplicationController
  def show
    @categories = Category.find(params[:id])
    @category_children = @categories.children
    render 'show', formats: 'json', handlers: 'jbuilder'
  end
end

