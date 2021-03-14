class RanksController < ApplicationController
  def index
    params[:genre_id] ||= 1
    genre = Genre.find(params[:genre_id])
    @genres = Genre.all
    @rakuten_ranks = RakutenWebService::Ichiba::Genre[genre.rakuten_id].ranking.to_a
    @yahoo_shopping_ranks = YahooShoppingWebService::Category.ranking(genre.yahoo_id)
  end

  def search
    @genres = Genre.all
    hit_items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
    hit_item_genre_id = hit_items.first.genre.id
    @rakuten_ranks = RakutenWebService::Ichiba::Genre[hit_item_genre_id].ranking.to_a
    hit_items = YahooShoppingWebService::Item.search(params[:keyword])
    hit_item_category_id = hit_items.first.genreCategory.id
    @yahoo_shopping_ranks = YahooShoppingWebService::Category.ranking(hit_item_category_id)
    render :index
  end
end
