Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :open_library, only: :show, param: :isbn
      resources :book, only: [:index, :show], param: :slug
      resources :book_suggestion, only: [:create]
      
      resources :user, only: :index do
        resources :rent, only: %i[create index]
      end

      get '/rent/book_rankings', to: 'rent#book_rankings', as: 'book_rankings'

    end
  end

  mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]

end
