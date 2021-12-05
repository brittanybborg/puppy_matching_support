class SireProfilesController < ApplicationController
  before_action :set_sire_profile, only: [:show, :edit, :update, :destroy]

  # GET /sire_profiles
  def index
    @sire_profiles = SireProfile.all
  end

  # GET /sire_profiles/1
  def show
  end

  # GET /sire_profiles/new
  def new
    @sire_profile = SireProfile.new
  end

  # GET /sire_profiles/1/edit
  def edit
  end

  # POST /sire_profiles
  def create
    @sire_profile = SireProfile.new(sire_profile_params)

    if @sire_profile.save
      redirect_to @sire_profile, notice: 'Sire profile was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sire_profiles/1
  def update
    if @sire_profile.update(sire_profile_params)
      redirect_to @sire_profile, notice: 'Sire profile was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sire_profiles/1
  def destroy
    @sire_profile.destroy
    redirect_to sire_profiles_url, notice: 'Sire profile was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sire_profile
      @sire_profile = SireProfile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sire_profile_params
      params.require(:sire_profile).permit(:name, :photo, :description, :previous_litters, :age)
    end
end
