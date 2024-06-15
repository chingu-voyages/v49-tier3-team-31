class ReviewsController < ApplicationController
  before_action :find_service, only: [:new, :create, :edit]
  before_action :authenticate_user!, only: [:new, :create, :edit]

  def new
    @review = @service.reviews.build
  end

  def create
    @review = @service.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to service_path(@service), notice: 'Review successfully created.'
    else
      flash[:alert] = @review.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def edit
    @review = Service.find(params[:service_id])
  end

  private

  def find_service
    @service = Service.find(params[:service_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment, :first_name)
  end
end
