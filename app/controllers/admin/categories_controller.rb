class Admin::CategoriesController < Admin::ApplicationController
  def index
    @categories = Category.all
  end

  def bulk_update
    categories_params.to_h.map do |id, param|
      category = Category.find(id)
      category.update!(param)
    end
    redirect_to action: :index
  end

  private

  def categories_params
    params.permit(categories: [:rakuten_id, :yahoo_id])[:categories]
  end
end
