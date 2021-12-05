class LittersController < ApplicationController
  before_action :set_litter, only: %i[show edit update destroy]

  # GET /litters
  def index
    @q = Litter.ransack(params[:q])
    @litters = @q.result(distinct: true).includes(:dog_profiles, :sire,
                                                  :bitch).page(params[:page]).per(10)
  end

  # GET /litters/1
  def show
    @puppy_profile = PuppyProfile.new
  end

  # GET /litters/new
  def new
    @litter = Litter.new
  end

  # GET /litters/1/edit
  def edit; end

  # POST /litters
  def create
    @litter = Litter.new(litter_params)

    if @litter.save
      message = "Litter was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @litter, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /litters/1
  def update
    if @litter.update(litter_params)
      redirect_to @litter, notice: "Litter was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /litters/1
  def destroy
    @litter.destroy
    message = "Litter was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to litters_url, notice: message
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_litter
    @litter = Litter.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def litter_params
    params.require(:litter).permit(:litter_name, :sire_id, :bitch_id,
                                   :puppy_count, :due_date, :puppy_release_date)
  end
end
