class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @reviews = current_user.reviews
    @reviews = current_user.reviews.page(params[:page]).per(5).order("created_at DESC")
  end
end
