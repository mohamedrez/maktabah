# frozen_string_literal: true

Rails.application.routes.draw do
  resources :home, only: [:index]
  resources :dashboard, only: [:index]
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :tracks, only: [:show, :index]
  resources :profiles, only: [:show, :edit]
  patch "/profiles/:id", to: "profiles#update", as: "update_profile"
  resources :courses do
    resources :steps, only: [:index, :show]
    patch '/steps/:id', to: 'steps#update_status', as: 'update_step_status'
  end
  post '/user_quiz_responses', to: 'user_quiz_responses#create'
  resources :user_progresses, only: [:create, :update]
end
