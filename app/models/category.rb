require 'csv'

class Category < ApplicationRecord
  has_ancestry

  def self.import!(file)
    update_attributes = %w(id name rakuten_id yahoo_id ancestry)
    CSV.foreach(file.path, headers: true) do |row|
      category = find_by(id: row['id']) || new
      category.attributes = row.to_hash.slice(*update_attributes)
      category.save
    end
  end
end