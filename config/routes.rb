Rails.application.routes.draw do
  devise_for :users
  
  root to: "homes#top"
  get "home/about", to: "homes#about"
  
  resources :books, only: [:index, :show, :edit, :update, :create, :destroy]
  resources :users, only: [:index, :show, :new, :edit, :update]
end
