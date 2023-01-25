class ListingsController < ApplicationController
  def show
    # joining two or more tables using includes
    # @list_var has listing data and listing image data and review data for listing id = 1
    # @list_var = Listing.includes(:listing_images, :reviews, :listing_sub_categories)
    #                    .where(listings: { id: params[:id] })

    @list_var = Listing.includes(:listing_images, :listing_sub_categories,
                                 :reviews => :user)
      .where(listings: { id: params[:id] })

    @secondary_images = @list_var[0].listing_images
    @reviews = @list_var[0].reviews
    @sub_categories_array = @list_var[0].listing_sub_categories

    # getting sub-categories ids 1,5,7
    sub_cat_id = @sub_categories_array.map { |subcategory| subcategory.id }
    # select * from sub_category where id in [1,5,7];
    @sub_categories = SubCategory.where("id in (?)", sub_cat_id)

    # x = [1,2,3]
    # squarex = x.map{ |y| y*y }
    # puts squarex.inspect
  end

  def index
    @anothervar = "this is test"
  end
end
