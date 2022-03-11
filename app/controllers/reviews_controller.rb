class ReviewsController < ApplicationController
  def create
    # id du restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
    # review content
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    # if params of review is correct we save the review
    respond_to do |format|
      if @review.save
        format.html { redirect_to restaurant_path(@restaurant) }
        format.json
      # else we return to show page with new form and error message
      else
        format.html { render 'restaurants/show' }
        format.json
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
