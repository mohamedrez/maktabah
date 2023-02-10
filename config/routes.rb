Rails.application.routes.draw do
  resources :home, only: [:index]
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :tracks, only: [:show]
  resources :profiles, only: [:show, :edit]
  patch '/profiles/:id', to: 'profiles#update', as: 'update_profile'
  resources :courses do
    resources :steps, only: [:index, :show]
  end

  resources :user_progresses, only: [:create, :update]
end
