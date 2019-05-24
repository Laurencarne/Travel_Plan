Rails.application.routes.draw do
  resources :activities
  resources :countries
  resources :trip_countries
  resources :trips
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
