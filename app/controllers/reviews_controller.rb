class ReviewsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show, :search]
  
  def index
    @reviews = Review.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @review = Review.new
  end

  def create 
    @review = Review.create(review_params)
    if @review.save
      redirect_to root_path
    else
      redirect_to new_review_path
    end
  end


  def destroy
    review = Review.find(params[:id])
    review.destroy
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
  end

  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
    @comments = @review.comments.includes(:user).order("created_at DESC")
  end

  def search
    @reviews = Review.search(params[:keyword])
    @reviews = @reviews.page(params[:page]).order("created_at DESC").page(params[:page]).per(5)
  end
  

  private
  def review_params
    params.require(:review).permit(:title, :artist, :text, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
