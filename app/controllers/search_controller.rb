class SearchController < ApplicationController
  def keyword
    @categories = Category.where(ancestry: nil)
    @rakuten_items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword]).to_a
    @yahoo_shopping_items = YahooShoppingWebService::Item.search(query: params[:keyword])
    render :index
  end

  def category
    @category = Category.find(params[:category_id] || 1)
    @categories = categories(@category)
    @rakuten_items = RakutenWebService::Ichiba::Genre[@category.rakuten_id].ranking.to_a
    @yahoo_shopping_items = YahooShoppingWebService::Category.ranking(@category.yahoo_id || 2494)
    render :index
  end

  private

  def categories(category)
    categories = params[:category_id].present? ? category.children : Category.where(ancestry: nil)
    categories = category.siblings if categories.blank?
    categories
  end
end
