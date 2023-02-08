Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "public_recipes#index"
  
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :show, :new, :create, :update, :destroy] do
    resources :recipe_foods, only: [:new, :create, :update, :destroy]
  end
  resources :inventories, only: [:index, :show, :new, :create, :destroy] do
    resources :inventory_foods, only: [:new, :create, :destroy]
  end
  
  resources :public_recipes, only: [:index]
  post 'shopping_list/:recipe_id', to: 'shopping_lists#generate'
  get 'shopping_list', to: 'shopping_lists#show'
end
