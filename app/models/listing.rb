class Listing < ApplicationRecord
  has_many :listing_images
  has_many :reviews
end
