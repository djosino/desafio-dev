# frozen_string_literal: true

Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  resources :documents, only: %i[index show new create]

  devise_for :users

  # root_path
  unauthenticated do
    root 'devise/sessions#new', as: 'unauthenticated'
  end
  authenticated do
    root 'documents#index'
  end

  # API
  namespace :api do
    post '/auth/login', to: 'authentication#login'
    resources :documents, only: %i[index show create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
