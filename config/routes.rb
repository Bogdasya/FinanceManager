Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "sessions" }
  root 'home#index'
  resources :users
end
