# frozen_string_literal: true

require "sidekiq/web"

Rails.application.routes.draw do
  # authenticate :user, ->(user) { user.admin? } do
  # end
  mount Motor::Admin => "/motor_admin"
  mount Sidekiq::Web => "/sidekiq"

  devise_for :users, only: :omniauth_callbacks, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}

  scope "(:locale)", locale: /en|ar/ do
    resources :home, only: [:index]
    resources :dashboard, only: [:index]

    devise_for :users, skip: :omniauth_callbacks
    delete "users", to: "devise/registrations#destroy", as: :destroy_user_registration
    get "users/profile/edit", to: "profiles#edit"
    patch "users/profile", to: "profiles#update"

    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")
    root "dashboard#index"
    resources :tracks, only: [:show, :index]
    resources :courses do
      resources :steps, only: [:index, :show, :new, :create]
    end
    post "/user_quiz_responses", to: "user_quiz_responses#create"
    resources :user_progresses, only: [:update]
    resources :user_progresses, only: [:create, :update]
    get "user_notifications", to: "user_notifications#index"
    get "user_notifications/notification_bell", to: "user_notifications#notification_bell"
  end
end
