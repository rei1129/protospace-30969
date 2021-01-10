Rails.application.routes.draw do
  #devise_for :installs
  devise_for :users
  #get 'prototypes/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "prototypes#index"

  #resources :prototypes, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  #resources :comments, only:[:create]
  #resources :users, only: :show

  resources :prototypes do
    resources :comments, only: [:create]
  end

  resources :users, only: :show
end
