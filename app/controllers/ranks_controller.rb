class RanksController < ApplicationController
  def index
    @categories = Category.where(ancestry: nil)
    @category = Category.find(params[:category_id] || 1)
    @rakuten_items = RakutenWebService::Ichiba::Genre[@category.rakuten_id].ranking.to_a
    @yahoo_shopping_items = YahooShoppingWebService::Category.ranking(@category.yahoo_id || 2494)
  end

  def search
    @categories = Category.where(ancestry: nil)
    @rakuten_items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword]).to_a
    @yahoo_shopping_items = YahooShoppingWebService::Item.search(query: params[:keyword])
    render :index
  end
end
