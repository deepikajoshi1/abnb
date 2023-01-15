class ListingsController < ApplicationController
  def show
    # joining two or more tables using includes
    # @list_var has listing data and listing image data and review data for listing id = 1
    @list_var = Listing.includes(:listing_images, :reviews)
                       .where(listings: { id: params[:id] })
    @secondary_images = @list_var[0].listing_images
    @reviews = @list_var[0].reviews
  end

  def index
    @anothervar = "this is test"
  end
end
