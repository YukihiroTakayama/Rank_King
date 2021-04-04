require 'csv'

CSV.generate do |csv|
  column_names = %w(id, name, rakuten_id, yahoo_id, ancestry)
  csv << column_names
  @categories.each do |category|
    column_values = [
      category.id,
      category.name,
      category.rakuten_id,
      category.yahoo_id,
      category.ancestry
    ]
    csv << column_values
  end
end