class ListingsController < ApplicationController
  def show
    # joining two tables using includes
    #  other option is to use Joins
    # @list_var has listing data and listing image data for listing id = 1
    @list_var = Listing.includes(:listing_images).where(listings: { id: params[:id] }).all

    @secondary_images = @list_var[0].listing_images

    # Getting reviews by listingg id
    @list_review_var = Listing.includes(:reviews).where(listings: { id: params[:id] }).all

    @reviews = @list_review_var[0].reviews

    # puts @list_review_var.inspect
    puts @reviews.inspect

  end

  def test
    @x = 'x'
  end

end
