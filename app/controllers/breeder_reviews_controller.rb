class BreederReviewsController < ApplicationController
  before_action :set_breeder_review, only: [:show, :edit, :update, :destroy]

  # GET /breeder_reviews
  def index
    @breeder_reviews = BreederReview.all
  end

  # GET /breeder_reviews/1
  def show
  end

  # GET /breeder_reviews/new
  def new
    @breeder_review = BreederReview.new
  end

  # GET /breeder_reviews/1/edit
  def edit
  end

  # POST /breeder_reviews
  def create
    @breeder_review = BreederReview.new(breeder_review_params)

    if @breeder_review.save
      redirect_to @breeder_review, notice: 'Breeder review was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /breeder_reviews/1
  def update
    if @breeder_review.update(breeder_review_params)
      redirect_to @breeder_review, notice: 'Breeder review was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /breeder_reviews/1
  def destroy
    @breeder_review.destroy
    redirect_to breeder_reviews_url, notice: 'Breeder review was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_breeder_review
      @breeder_review = BreederReview.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def breeder_review_params
      params.require(:breeder_review).permit(:description, :buyer_id)
    end
end
