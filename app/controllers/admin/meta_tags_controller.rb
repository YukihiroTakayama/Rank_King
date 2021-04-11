class Admin::MetaTagsController < Admin::ApplicationController

  def index
    @meta_tags = MetaTag.includes(:properties)
    respond_to do |format|
      format.html do
      end
      format.csv do
      end
    end
  end

  def create
    meta_tag = MetaTag.create
    meta_tag.properties.create
    redirect_to action: :index
  end

  def add_property
    MetaTag.find(params[:meta_tag_id]).properties.create
    redirect_to action: :index
  end

  def destroy
    MetaTag.find(params[:id]).destroy
    redirect_to action: :index
  end

  def bulk_update
    meta_tags_params.to_h.map do |id, param|
      meta_tag = MetaTag.find(id)
      meta_tag.update!(param)
    end
    redirect_to action: :index
  end

  def import
    MetaTag.import!(params[:file])
    redirect_to action: :index
  end

  private

  def meta_tags_params
    params.permit(meta_tags: [:name, { properties_attributes: [:id, :name, :value] }])[:meta_tags]
  end
end
