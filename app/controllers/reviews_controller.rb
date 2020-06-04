class ReviewsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @reviews = Review.all.order("created_at DESC")
  end

  def new
    @review = Review.new
  end

  def create 
    # binding.pry
    Review.create(review_params)
    redirect_to root_path
  end

  def show
    @review = Review.find(params[:id])
  end
  
  private
  def review_params
    params.require(:review).permit(:title, :artist, :text, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
