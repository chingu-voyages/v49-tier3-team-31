class ReviewsController < ApplicationController
  before_action :find_service, only: [:new, :create]

  def new
    @review = Review.new
    # @review = @service.reviews.build
  end

  def create
    @service = Service.find(params[:id])
    @review = @service.reviews.create(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to service_path(@service)
    else
        render 'new'
        @review.errors.full_messages
    end
  end

  private

  def find_service
    @service = Service.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment, :user_id)
  end




end
