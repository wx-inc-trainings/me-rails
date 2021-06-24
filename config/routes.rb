Rails.application.routes.draw do
  namespace :api do
    resources :open_library, only: :show, param: :isbn
    resources :book, only: [:index, :show], param: :slug
    resources :book_suggestion, only: [:create]
    resources :rent, only: [:index, :create]
  end

  mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
end
