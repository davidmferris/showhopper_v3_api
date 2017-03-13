Rails.application.routes.draw do
  apipie
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace  :v1 do
      resources :shows, only: :index
      resources :locations, only: :index
    end
  end
end
