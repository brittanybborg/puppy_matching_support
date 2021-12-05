class PuppyProfilesController < ApplicationController
  before_action :set_puppy_profile, only: %i[show edit update destroy]

  def index
    @q = PuppyProfile.ransack(params[:q])
    @puppy_profiles = @q.result(distinct: true).includes(:buyer_favorites,
                                                         :litter, :bitch, :sire).page(params[:page]).per(10)
  end

  def show
    @buyer_favorite = BuyerFavorite.new
  end

  def new
    @puppy_profile = PuppyProfile.new
  end

  def edit; end

  def create
    @puppy_profile = PuppyProfile.new(puppy_profile_params)

    if @puppy_profile.save
      message = "PuppyProfile was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @puppy_profile, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @puppy_profile.update(puppy_profile_params)
      redirect_to @puppy_profile,
                  notice: "Puppy profile was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @puppy_profile.destroy
    message = "PuppyProfile was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to puppy_profiles_url, notice: message
    end
  end

  private

  def set_puppy_profile
    @puppy_profile = PuppyProfile.find(params[:id])
  end

  def puppy_profile_params
    params.require(:puppy_profile).permit(:name, :litter_id, :alpha_true,
                                          :runt_true, :activity_level, :photo, :description)
  end
end
