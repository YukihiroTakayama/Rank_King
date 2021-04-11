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
    return if category.nil?

    categoriy_paths = category.path.map do |c|
      link_to c.name, search_category_path(category_id: c.id)
    end
    categoriy_paths.join(' / ').html_safe
  end

  def meta_tags
    meta_tags = MetaTag.all.map do |meta_tag|
      properties = meta_tag.properties.map { |property| "#{property.name}=#{property.value}" }.join(' ')
      "<meta name=#{meta_tag.name} #{properties}>"
    end
    meta_tags.join("\n").html_safe
  end
end
