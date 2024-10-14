Rails.application.routes.draw do
  root to: "home#index"

  get "home/index"
  get "home/credits"

  resources :roads
  resources :reasons
  resources :places
  resources :structures
  resources :transports
  resources :veichles
  resources :reimbursements

  devise_for :users, skip: [:registrations]
  as :user do
    get "users/edit" => "devise/registrations#edit", :as => "edit_user_registration"
    put "users" => "devise/registrations#update", :as => "user_registration"
  end

  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
end
