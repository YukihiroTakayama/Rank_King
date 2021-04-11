class MetaTag < ApplicationRecord
  has_many :properties, class_name: 'MetaTagProperty', dependent: :destroy
  accepts_nested_attributes_for :properties, allow_destroy: true

  def self.import!(file)
    CSV.foreach(file.path, headers: true) do |row|
      if row['table_name'] == 'meta_tags'
        update_attributes = %w(id name)
        meta_tag = find_by(id: row['id']) || new
        meta_tag.attributes = row.to_hash.slice(*update_attributes)
        meta_tag.save!
      elsif row['table_name'] == 'meta_tag_properties'
        update_attributes = %w(id name value meta_tag_id)
        meta_tag = find_by(id: row['meta_tag_id']) || new
        property = meta_tag.properties.find_by(id: row['id']) || meta_tag.properties.new
        property.attributes = row.to_hash.slice(*update_attributes)
        property.save!
      end
    end
  end
end
