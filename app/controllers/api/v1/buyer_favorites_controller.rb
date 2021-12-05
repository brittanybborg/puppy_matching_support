class Api::V1::BuyerFavoritesController < Api::V1::GraphitiController
  def index
    buyer_favorites = BuyerFavoriteResource.all(params)
    respond_with(buyer_favorites)
  end

  def show
    buyer_favorite = BuyerFavoriteResource.find(params)
    respond_with(buyer_favorite)
  end

  def create
    buyer_favorite = BuyerFavoriteResource.build(params)

    if buyer_favorite.save
      render jsonapi: buyer_favorite, status: 201
    else
      render jsonapi_errors: buyer_favorite
    end
  end

  def update
    buyer_favorite = BuyerFavoriteResource.find(params)

    if buyer_favorite.update_attributes
      render jsonapi: buyer_favorite
    else
      render jsonapi_errors: buyer_favorite
    end
  end

  def destroy
    buyer_favorite = BuyerFavoriteResource.find(params)

    if buyer_favorite.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: buyer_favorite
    end
  end
end
