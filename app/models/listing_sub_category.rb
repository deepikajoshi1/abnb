class ListingSubCategory < ApplicationRecord
  belongs_to :listing
  belongs_to :sub_category
end
