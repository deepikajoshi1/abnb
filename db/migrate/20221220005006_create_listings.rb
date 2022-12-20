class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.string :name
      t.string :headline
      t.string :description
      t.string :city
      t.string :state
      t.string :country
      t.string :address_line1
      t.string :address_line2

      t.timestamps
    end
  end
end
