class BuyerFavoritesController < ApplicationController
  before_action :set_buyer_favorite, only: %i[show edit update destroy]

  # GET /buyer_favorites
  def index
    @q = BuyerFavorite.ransack(params[:q])
    @buyer_favorites = @q.result(distinct: true).includes(:user,
                                                          :puppy).page(params[:page]).per(10)
  end

  # GET /buyer_favorites/1
  def show; end

  # GET /buyer_favorites/new
  def new
    @buyer_favorite = BuyerFavorite.new
  end

  # GET /buyer_favorites/1/edit
  def edit; end

  # POST /buyer_favorites
  def create
    @buyer_favorite = BuyerFavorite.new(buyer_favorite_params)

    if @buyer_favorite.save
      message = "BuyerFavorite was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @buyer_favorite, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /buyer_favorites/1
  def update
    if @buyer_favorite.update(buyer_favorite_params)
      redirect_to @buyer_favorite,
                  notice: "Buyer favorite was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /buyer_favorites/1
  def destroy
    @buyer_favorite.destroy
    message = "BuyerFavorite was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to buyer_favorites_url, notice: message
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_buyer_favorite
    @buyer_favorite = BuyerFavorite.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def buyer_favorite_params
    params.require(:buyer_favorite).permit(:user_id, :puppy_id)
  end
end
