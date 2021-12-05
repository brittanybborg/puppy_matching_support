class Api::V1::SireProfilesController < Api::V1::GraphitiController
  def index
    sire_profiles = SireProfileResource.all(params)
    respond_with(sire_profiles)
  end

  def show
    sire_profile = SireProfileResource.find(params)
    respond_with(sire_profile)
  end

  def create
    sire_profile = SireProfileResource.build(params)

    if sire_profile.save
      render jsonapi: sire_profile, status: :created
    else
      render jsonapi_errors: sire_profile
    end
  end

  def update
    sire_profile = SireProfileResource.find(params)

    if sire_profile.update_attributes
      render jsonapi: sire_profile
    else
      render jsonapi_errors: sire_profile
    end
  end

  def destroy
    sire_profile = SireProfileResource.find(params)

    if sire_profile.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: sire_profile
    end
  end
end
