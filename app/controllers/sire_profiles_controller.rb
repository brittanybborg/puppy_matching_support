class SireProfilesController < ApplicationController
  before_action :set_sire_profile, only: %i[show edit update destroy]

  def index
    @q = SireProfile.ransack(params[:q])
    @sire_profiles = @q.result(distinct: true).includes(:litters,
                                                        :dog_profiles).page(params[:page]).per(10)
  end

  def show
    @litter = Litter.new
  end

  def new
    @sire_profile = SireProfile.new
  end

  def edit; end

  def create
    @sire_profile = SireProfile.new(sire_profile_params)

    if @sire_profile.save
      redirect_to @sire_profile,
                  notice: "Sire profile was successfully created."
    else
      render :new
    end
  end

  def update
    if @sire_profile.update(sire_profile_params)
      redirect_to @sire_profile,
                  notice: "Sire profile was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @sire_profile.destroy
    redirect_to sire_profiles_url,
                notice: "Sire profile was successfully destroyed."
  end

  private

  def set_sire_profile
    @sire_profile = SireProfile.find(params[:id])
  end

  def sire_profile_params
    params.require(:sire_profile).permit(:name, :photo, :description,
                                         :previous_litters, :age)
  end
end
