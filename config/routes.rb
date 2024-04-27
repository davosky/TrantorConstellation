Rails.application.routes.draw do
  root "home#index"

  get "home/index"
  get "home/credits"

  devise_for :users, skip: [:registrations]
  as :user do
    get "users/edit" => "devise/registrations#edit", :as => "edit_user_registration"
    put "users" => "devise/registrations#update", :as => "user_registration"
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
