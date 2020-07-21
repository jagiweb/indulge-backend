Rails.application.routes.draw do
  resources :matches
  resources :participants
  resources :teams
  resources :seasons
  resources :tournaments
  resources :users

  # Sign In, Sign Up and Validate users with token
  post "/sign-in", to: "users#sign_in"
  post "/sign-up", to: "users#sign_up"
  get "/validate", to: "users#validate"

  # Tournaments 
  get "/get-tournament/:id", to: "tournaments#get_tournament"
  get "/get-tournaments/:id", to: "users#get_tournaments"
  post "/create-tournament", to: "tournaments#create_tournament"

  # Seasons
  get "/get-season/:id", to: "seasons#get_season"
  post "/create-season", to: "seasons#create_season"

  # Teams
  get "/get-team/:id", to: "matches#get_team"
  post "/create-team", to: "matches#create_team"

  # Matches
  get "/get-match/:id", to: "matches#get_match"
  post "/create-match", to: "matches#create_match"

  # Participants
  get "/get-participant/:id", to: "participants#get_participant"
  post "/create-participant", to: "participants#create_participant"


end
