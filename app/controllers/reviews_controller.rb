class ReviewsController < ApplicationController

  def new
    @greenspace = Greenspace.find(params[:greenspace_id])
    @review = Review.new
  end

  def create
    @greenspace = Greenspace.find(params[:greenspace_id])
    @greenspace.reviews.create(review_params)
    redirect_to greenspaces_path
  end

  private

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end

end
