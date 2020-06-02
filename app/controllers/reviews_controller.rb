class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create 
    # binding.pry
    Review.create(review_params)
    redirect_to root_path
  end

  private
  def review_params
    params.require(:review).permit(:title, :artist, :text, :image)
  end
end
