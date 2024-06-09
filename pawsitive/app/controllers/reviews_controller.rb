class ReviewsController < ApplicationController
  # before_action :find_services, only: [:new, :create]

  def new
    @service = Service.find(params[:service_id])
    @review = @service.reviews.build

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

  def review_params
    params.require(:review).permit(:rating, :comment, :service_id, :user_id)
  end


  # def find_services
  #   @service = Service.find(params[:service_id])
  # end

end
