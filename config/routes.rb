Rails.application.routes.draw do
  
  namespace :api do
    resources :open_library, only: :show, param: :isbn
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
