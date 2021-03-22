class CategoriesController < ApplicationController
  def new
    children = Category.find(params[:parent_id]).children
    render json: children
  end
end