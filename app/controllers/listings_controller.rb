class ListingsController < ApplicationController
  def show
    @list_var = Listing.includes(:listing_images).where(listings: { id: params[:id] }).all
    @secondary_images = @list_var[0].listing_images


    @x = Listing.joins(:listing_images)

    @x.each do |list1|
      puts list1.primary_image_url
      puts list1.listing_images.inspect
    end
  end
end
