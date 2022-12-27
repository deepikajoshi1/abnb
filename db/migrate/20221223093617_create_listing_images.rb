class CreateListingImages < ActiveRecord::Migration[7.0]
  def change
    create_table :listing_images do |t|
      t.string :listing_image_secondary_url
      t.references :listing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
