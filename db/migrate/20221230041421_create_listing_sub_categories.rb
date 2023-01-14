class CreateListingSubCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :listing_sub_categories do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :sub_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
