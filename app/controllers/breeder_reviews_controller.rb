class BreederReviewsController < ApplicationController
  before_action :current_user_profile_must_be_breeder_review_user,
                only: %i[edit update destroy]

  before_action :set_breeder_review, only: %i[show edit update destroy]

  def index
    @q = BreederReview.ransack(params[:q])
    @breeder_reviews = @q.result(distinct: true).includes(:user).page(params[:page]).per(10)
  end

  def show; end

  def new
    @breeder_review = BreederReview.new
  end

  def edit; end

  def create
    @breeder_review = BreederReview.new(breeder_review_params)

    if @breeder_review.save
      message = "BreederReview was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @breeder_review, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @breeder_review.update(breeder_review_params)
      redirect_to @breeder_review,
                  notice: "Breeder review was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @breeder_review.destroy
    message = "BreederReview was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to breeder_reviews_url, notice: message
    end
  end

  private

  def current_user_profile_must_be_breeder_review_user
    set_breeder_review
    unless current_user_profile == @breeder_review.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_breeder_review
    @breeder_review = BreederReview.find(params[:id])
  end

  def breeder_review_params
    params.require(:breeder_review).permit(:description, :buyer_id)
  end
end
