class BitchProfilesController < ApplicationController
  before_action :set_bitch_profile, only: %i[show edit update destroy]

  # GET /bitch_profiles
  def index
    @q = BitchProfile.ransack(params[:q])
    @bitch_profiles = @q.result(distinct: true).includes(:litters,
                                                         :dog_profiles).page(params[:page]).per(10)
  end

  # GET /bitch_profiles/1
  def show
    @litter = Litter.new
  end

  # GET /bitch_profiles/new
  def new
    @bitch_profile = BitchProfile.new
  end

  # GET /bitch_profiles/1/edit
  def edit; end

  # POST /bitch_profiles
  def create
    @bitch_profile = BitchProfile.new(bitch_profile_params)

    if @bitch_profile.save
      redirect_to @bitch_profile,
                  notice: "Bitch profile was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /bitch_profiles/1
  def update
    if @bitch_profile.update(bitch_profile_params)
      redirect_to @bitch_profile,
                  notice: "Bitch profile was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /bitch_profiles/1
  def destroy
    @bitch_profile.destroy
    redirect_to bitch_profiles_url,
                notice: "Bitch profile was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bitch_profile
    @bitch_profile = BitchProfile.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def bitch_profile_params
    params.require(:bitch_profile).permit(:name, :photo, :description,
                                          :previous_litters, :age)
  end
end
