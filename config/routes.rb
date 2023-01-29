Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :tracks, only: [:show]
  resources :profiles, only: [:show]
  resources :courses do
    resources :steps, only: [:index, :show]
  end
end
