# db/migrate/YYYYMMDDHHMMSS_add_description_to_sub_category.rb
class AddDescriptionToSubCategory < ActiveRecord::Migration[7.0]
  def change
    add_column :sub_categories, :description, :string
  end
end
