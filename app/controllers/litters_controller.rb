class LittersController < ApplicationController
  before_action :set_litter, only: %i[show edit update destroy]

  def index
    @q = Litter.ransack(params[:q])
    @litters = @q.result(distinct: true).includes(:dog_profiles, :sire,
                                                  :bitch).page(params[:page]).per(10)
  end

  def show
    @puppy_profile = PuppyProfile.new
  end

  def new
    @litter = Litter.new
  end

  def edit; end

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

  def update
    if @litter.update(litter_params)
      redirect_to @litter, notice: "Litter was successfully updated."
    else
      render :edit
    end
  end

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

  def set_litter
    @litter = Litter.find(params[:id])
  end

  def litter_params
    params.require(:litter).permit(:litter_name, :sire_id, :bitch_id,
                                   :puppy_count, :due_date, :puppy_release_date)
  end
end
