Rails.application.routes.draw do
  root "home#index"

  get "home/index"
  get "home/credits"

  resources :veichles
  resources :transports
  resources :mission_reasons
  resources :mission_paths
  resources :mission_places
  resources :mission_structures

  devise_for :operators, skip: [:registrations]
  as :operator do
    get "operators/edit" => "devise/registrations#edit", :as => "edit_operator_registration"
    put "operators" => "devise/registrations#update", :as => "operator_registration"
  end

  mount RailsAdmin::Engine => "/admin", as: "rails_admin"

  get "up" => "rails/health#show", as: :rails_health_check
end
