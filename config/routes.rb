Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    scope module: 'api/v1', as: 'api' do
      resources :buyer_favorites

      resources :breeder_reviews

      resources :litters

      resources :puppy_profiles

      resources :user_profiles

    end
    mount VandalUi::Engine, at: '/vandal'
    # your routes go here
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "puppy_profiles#index"
  resources :bitch_profiles
  resources :sire_profiles
  resources :buyer_favorites
  resources :breeder_reviews
  resources :litters
  resources :puppy_profiles
  devise_for :user_profiles
  resources :user_profiles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
