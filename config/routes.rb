Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  patch 'pokemon/:id',to:'pokemon#capture', as:'capture'
  delete 'pokemon/:id',to:'pokemon#damage', as:'damage'
  get 'pokemon/new', to:'pokemon#new', as:'new_pokemon'
end
