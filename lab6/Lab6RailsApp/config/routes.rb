Rails.application.routes.draw do
  get "properties/buy"
  get "properties/rent"
  get "properties/daily"

  get "about", to: "properties#about", as: :about

  delete "properties/destroy_all",
         to: "properties#destroy_all",
         as: :destroy_all_properties

  resources :properties
  resources :users

  get "hi/index"

  get "up" => "rails/health#show", as: :rails_health_check
end