class Admin::CategoriesController < Admin::ApplicationController
  def index
    respond_to do |format|
      format.html do
        @root_categories = Category.roots
      end
      format.csv do
        @categories = Category.all
      end
    end
  end

  def bulk_update
    categories_params.to_h.map do |id, param|
      category = Category.find(id)
      category.update!(param)
    end
    redirect_to action: :index
  end

  def import
    Category.import!(params[:file])
    redirect_to action: :index
  end

  private

  def categories_params
    params.permit(categories: [:name, :rakuten_id, :yahoo_id])[:categories]
  end
end
