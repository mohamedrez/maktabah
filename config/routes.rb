# frozen_string_literal: true

Rails.application.routes.draw do
  mount Motor::Admin => "/motor_admin"
  scope "(:locale)", locale: /en|ar/ do
    resources :home, only: [:index]
    resources :dashboard, only: [:index]
    devise_for :users
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")
    # root "articles#index"
    resources :tracks, only: [:show, :index]
    resources :courses do
      resources :steps, only: [:index, :show, :new, :create]
    end
    post "/user_quiz_responses", to: "user_quiz_responses#create"
    resources :user_progresses, only: [:update]
  end
end
