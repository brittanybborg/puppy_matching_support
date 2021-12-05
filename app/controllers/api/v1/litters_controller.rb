class Api::V1::LittersController < Api::V1::GraphitiController
  def index
    litters = LitterResource.all(params)
    respond_with(litters)
  end

  def show
    litter = LitterResource.find(params)
    respond_with(litter)
  end

  def create
    litter = LitterResource.build(params)

    if litter.save
      render jsonapi: litter, status: :created
    else
      render jsonapi_errors: litter
    end
  end

  def update
    litter = LitterResource.find(params)

    if litter.update_attributes
      render jsonapi: litter
    else
      render jsonapi_errors: litter
    end
  end

  def destroy
    litter = LitterResource.find(params)

    if litter.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: litter
    end
  end
end
