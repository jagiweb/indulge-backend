Rails.application.routes.draw do
  resources :matches
  resources :participants
  resources :teams
  resources :seasons
  resources :tournaments
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post "/sign-in", to: "users#sign_in"
  post "/sign-up", to: "users#sign_up"
  get "/validate", to: "users#validate"
end
