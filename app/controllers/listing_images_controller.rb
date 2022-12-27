class ListingsImagesController < ApplicationController
  def show
    @listing_images = ListingImage.find(params[:id])
  end
end
