class BitchProfilesController < ApplicationController
  before_action :set_bitch_profile, only: %i[show edit update destroy]

  def index
    @q = BitchProfile.ransack(params[:q])
    @bitch_profiles = @q.result(distinct: true).includes(:litters,
                                                         :dog_profiles).page(params[:page]).per(10)
  end

  def show
    @litter = Litter.new
  end

  def new
    @bitch_profile = BitchProfile.new
  end

  def edit; end

  def create
    @bitch_profile = BitchProfile.new(bitch_profile_params)

    if @bitch_profile.save
      redirect_to @bitch_profile,
                  notice: "Bitch profile was successfully created."
    else
      render :new
    end
  end

  def update
    if @bitch_profile.update(bitch_profile_params)
      redirect_to @bitch_profile,
                  notice: "Bitch profile was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @bitch_profile.destroy
    redirect_to bitch_profiles_url,
                notice: "Bitch profile was successfully destroyed."
  end

  private

  def set_bitch_profile
    @bitch_profile = BitchProfile.find(params[:id])
  end

  def bitch_profile_params
    params.require(:bitch_profile).permit(:name, :photo, :description,
                                          :previous_litters, :age)
  end
end
