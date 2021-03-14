module ApplicationHelper
  def yahoo_shopping_item(item_name)
    YahooShoppingWebService::Item.search(query: item_name).first
  end
end
