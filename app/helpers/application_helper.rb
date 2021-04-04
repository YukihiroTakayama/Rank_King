module ApplicationHelper
  def yahoo_shopping_item_info(itemcode)
    YahooShoppingWebService::Item.lookup(itemcode)
  end

  def category_info(category_id)
    YahooShoppingWebService::Category.search(category_id)
  end

  def yahoo_shopping_item_url(item)
    return item.image.medium if action_name == 'keyword'

    item.Image.Medium
  end

  def yahoo_shopping_item_price(item)
    return item.price if action_name == 'keyword'

    item = yahoo_shopping_item_info(item.Code)
    item&.Hit&.Price
  end

  def categories_breadcrumb(category)
    category.path.map(&:name).join(' / ') if category.present?
  end
end
