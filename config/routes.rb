Rails.application.routes.draw do
  namespace :api do
    resources :open_library, only: :show, param: :isbn
  end

  mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
end
