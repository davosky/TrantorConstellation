Rails.application.routes.draw do
  root "home#index"

  get "home/index"
  get "home/credits"

  devise_for :operators, skip: [:registrations]
  as :user do
    get "operators/edit" => "devise/registrations#edit", :as => "edit_user_registration"
    put "operators" => "devise/registrations#update", :as => "user_registration"
  end

  mount RailsAdmin::Engine => "/admin", as: "rails_admin"

  get "up" => "rails/health#show", as: :rails_health_check
end
