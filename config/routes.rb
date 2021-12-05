Rails.application.routes.draw do
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
