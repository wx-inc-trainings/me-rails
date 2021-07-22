require 'sidekiq/web' 
require 'sidekiq-scheduler/web'

Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :books
      resources :rents
      resources :book_suggestions

      root to: "users#index"
  end

  namespace :api do
    namespace :v1 do
      resources :open_library, only: :show, param: :isbn
      resources :book, only: [:index, :show], param: :slug
      resources :book_suggestion, only: [:create]
      
      resources :user, only: :index do
        resources :rent, only: %i[create index]
      end

      scope 'rents' do
        get '/book_rankings', to: 'rent#book_rankings', as: 'book_rankings'
        get '/active', to: 'rent#active_rents', as: 'active_rents'
      end
      
    end
  end

  mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]

  mount Sidekiq::Web => '/sidekiq' 

  get '/login', to: 'auth/sessions#login', as: 'auth_login_form'
  post '/login', to: 'auth/sessions#create', as: 'auth_login'

  get '/401', to: 'page_error#page_401', as: 'page_unauthorize'
end
