class Api::V1::PuppyProfilesController < Api::V1::GraphitiController
  def index
    puppy_profiles = PuppyProfileResource.all(params)
    respond_with(puppy_profiles)
  end

  def show
    puppy_profile = PuppyProfileResource.find(params)
    respond_with(puppy_profile)
  end

  def create
    puppy_profile = PuppyProfileResource.build(params)

    if puppy_profile.save
      render jsonapi: puppy_profile, status: 201
    else
      render jsonapi_errors: puppy_profile
    end
  end

  def update
    puppy_profile = PuppyProfileResource.find(params)

    if puppy_profile.update_attributes
      render jsonapi: puppy_profile
    else
      render jsonapi_errors: puppy_profile
    end
  end

  def destroy
    puppy_profile = PuppyProfileResource.find(params)

    if puppy_profile.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: puppy_profile
    end
  end
end
