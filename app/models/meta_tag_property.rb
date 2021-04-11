class MetaTagProperty < ApplicationRecord
  belongs_to :meta_tag, foreign_key: :meta_tag_id
end
