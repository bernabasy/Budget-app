# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users

  resources :groups, only: [:index, :new, :create, :destroy] do
    resources :entities, only: [:index, :new, :create, :destroy]
 end           
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "home#index"
end
