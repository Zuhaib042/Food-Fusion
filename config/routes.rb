# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'public_recipes#index'

  resources :foods, only: %i[index new create destroy]
  resources :recipes, only: %i[index show new create update destroy] do
    resources :recipe_foods, only: %i[new create update destroy]
  end
  resources :inventories, only: %i[index show new create destroy] do
    resources :inventory_foods, only: %i[new create destroy]
  end

  resources :public_recipes, only: [:index]
  post 'shopping_list/:recipe_id', to: 'shopping_lists#generate'
  get 'shopping_list', to: 'shopping_lists#show'
end
