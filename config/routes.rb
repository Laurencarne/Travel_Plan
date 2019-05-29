Rails.application.routes.draw do
  get 'sessions/bundle'
  get 'sessions/install'
  resources :selected_activities
  resources :activities
  resources :countries
  resources :trip_countries
  resources :trips
  resources :users
  resources :reviews

  get "/africa", to: "countries#africa", as: "africa"
  get "/asia", to: "countries#asia", as: "asia"
  get "/europe", to: "countries#europe", as: "europe"
  get "/oceania", to: "countries#oceania", as: "oceania"
  get "/north_america", to: "countries#north_america", as: "north_america"
  get "/south_america", to: "countries#south_america", as: "south_america"

  get "/search", to: "countries#search", as: "search"

  get "/", to: "users#home", as: "/"
  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  post "sessions", to: "sessions#create", as: "sessions"
end
