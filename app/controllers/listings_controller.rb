class ListingsController < ApplicationController
  def show
    # joining two or more tables using includes
    # @list_var has listing data and listing image data and review data for listing id = 1
    @list_var = Listing.includes(:listing_images, :reviews, :listing_sub_categories)
                       .where(listings: { id: params[:id] })
    @secondary_images = @list_var[0].listing_images
    @reviews = @list_var[0].reviews
    @sub_categories_array = @list_var[0].listing_sub_categories

    # getting sub-categories ids
    sub_cat_id = @sub_categories_array.map { |subcategory| subcategory.id }
    @sub_categories = SubCategory.where('id in (?)', sub_cat_id)

    puts @sub_categories.inspect

    # iterate and get review id
    # add where clause with where('id in (?)', review_id)
    # Reviews.includes(:users). where (reviews : {id})
  end

  def index
    @anothervar = "this is test"
  end
end
