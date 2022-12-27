class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.string :name
      t.string :headline
      t.text :description
      t.string :city
      t.string :state
      t.string :country
      t.string :address_line_1
      t.string :address_line_2
      t.integer :price
      t.string :primary_image_url

      t.timestamps
    end
  end
end
