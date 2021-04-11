require 'csv'

CSV.generate do |csv|
  csv << %w(table_name id name value meta_tag_id)
  @meta_tags.each do |meta_tag|
    column_values = [
      'meta_tags',
      meta_tag.id,
      meta_tag.name
    ]
    csv << column_values

    meta_tag.properties.each do |property|
      column_values = [
        'meta_tag_properties',
        property.id,
        property.name,
        property.value,
        property.meta_tag_id
      ]
      csv << column_values
    end
  end
end