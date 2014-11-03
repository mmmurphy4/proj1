Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  resources :pokemons
  patch 'pokemons/:id',to:'pokemons#capture', as:'capture'
  delete 'pokemons/:id',to:'pokemons#damage', as:'damage'
  # get 'pokemons/new', to:'pokemons#new', as:'new_pokemon'
  # post 'pokemons/create', to:'pokemons#create', as:'create_pokemon'
end
