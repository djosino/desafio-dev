# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  # root_path
  unauthenticated do
    root 'devise/sessions#new', as: 'unauthenticated'
  end
  authenticated do
    root 'home#index'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
