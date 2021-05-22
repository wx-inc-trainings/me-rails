Rails.application.routes.draw do
  get 'api/open-library', to: 'open_library#index', at: "open_library_api_get"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
