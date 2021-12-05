class PuppyProfilesController < ApplicationController
  before_action :set_puppy_profile, only: [:show, :edit, :update, :destroy]

  # GET /puppy_profiles
  def index
    @puppy_profiles = PuppyProfile.all
  end

  # GET /puppy_profiles/1
  def show
  end

  # GET /puppy_profiles/new
  def new
    @puppy_profile = PuppyProfile.new
  end

  # GET /puppy_profiles/1/edit
  def edit
  end

  # POST /puppy_profiles
  def create
    @puppy_profile = PuppyProfile.new(puppy_profile_params)

    if @puppy_profile.save
      redirect_to @puppy_profile, notice: 'Puppy profile was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /puppy_profiles/1
  def update
    if @puppy_profile.update(puppy_profile_params)
      redirect_to @puppy_profile, notice: 'Puppy profile was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /puppy_profiles/1
  def destroy
    @puppy_profile.destroy
    redirect_to puppy_profiles_url, notice: 'Puppy profile was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_puppy_profile
      @puppy_profile = PuppyProfile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def puppy_profile_params
      params.require(:puppy_profile).permit(:name, :litter_id, :alpha_true, :runt_true, :activity_level, :photo, :description)
    end
end
