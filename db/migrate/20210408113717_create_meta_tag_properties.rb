class CreateMetaTagProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :meta_tag_properties do |t|
      t.string :name
      t.string :value
      t.integer :meta_tag_id

      t.timestamps
    end
  end
end
