class Api::V1::BitchProfilesController < Api::V1::GraphitiController
  def index
    bitch_profiles = BitchProfileResource.all(params)
    respond_with(bitch_profiles)
  end

  def show
    bitch_profile = BitchProfileResource.find(params)
    respond_with(bitch_profile)
  end

  def create
    bitch_profile = BitchProfileResource.build(params)

    if bitch_profile.save
      render jsonapi: bitch_profile, status: 201
    else
      render jsonapi_errors: bitch_profile
    end
  end

  def update
    bitch_profile = BitchProfileResource.find(params)

    if bitch_profile.update_attributes
      render jsonapi: bitch_profile
    else
      render jsonapi_errors: bitch_profile
    end
  end

  def destroy
    bitch_profile = BitchProfileResource.find(params)

    if bitch_profile.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: bitch_profile
    end
  end
end
