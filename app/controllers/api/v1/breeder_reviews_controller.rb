class Api::V1::BreederReviewsController < Api::V1::GraphitiController
  def index
    breeder_reviews = BreederReviewResource.all(params)
    respond_with(breeder_reviews)
  end

  def show
    breeder_review = BreederReviewResource.find(params)
    respond_with(breeder_review)
  end

  def create
    breeder_review = BreederReviewResource.build(params)

    if breeder_review.save
      render jsonapi: breeder_review, status: 201
    else
      render jsonapi_errors: breeder_review
    end
  end

  def update
    breeder_review = BreederReviewResource.find(params)

    if breeder_review.update_attributes
      render jsonapi: breeder_review
    else
      render jsonapi_errors: breeder_review
    end
  end

  def destroy
    breeder_review = BreederReviewResource.find(params)

    if breeder_review.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: breeder_review
    end
  end
end
