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
  # get "/get-tournament/:id", to: "tournaments#get_tournament"
  # get "/get-tournaments/:id", to: "users#get_tournaments"
  # post "/create-tournament", to: "tournaments#create_tournament"

  post    "/tournament",      to: "tournaments#create_tournament"
  get     "/tournament/:id",  to: "tournaments#get_tournament"
  put     "/tournament/:id",  to: "tournaments#update_tournament"
  delete  "/tournament/:id",  to: "tournaments#delete_tournament"
  get     "/tournaments",     to: "users#get_tournaments"
  
  

  # Seasons
  # get "/get-season/:id", to: "seasons#get_season"
  # post "/create-season", to: "seasons#create_season"

  post    "/season",      to: "seasons#create_season"
  get     "/season/:id",  to: "seasons#get_season"
  put     "/season/:id",  to: "seasons#update_season"
  delete  "/season/:id",  to: "seasons#delete_season"


  # Teams
  # get "/get-team/:id", to: "teams#get_team"
  # post "/create-team", to: "teams#create_team"

  post    "/team",      to: "teams#create_team"
  get     "/team/:id",  to: "teams#get_team"
  get     "/team-s/:id",  to: "teams#get_teams"
  put     "/team/:id",  to: "teams#update_team"
  delete  "/team/:id",  to: "teams#delete_team"

  # Matches
  # get "/get-match/:id", to: "matches#get_match"
  # post "/create-match", to: "matches#create_match"

  post    "/match",      to: "matches#create_match"
  get     "/match/:id",  to: "matches#get_match"
  get     "/match-es/:id",to: "matches#get_matches"
  put     "/match/:id",  to: "matches#update_match"
  delete  "/match/:id",  to: "matches#delete_match"

  # Participants
  # get "/get-participant/:id", to: "participants#get_participant"
  # post "/create-participant", to: "participants#create_participant"


end
