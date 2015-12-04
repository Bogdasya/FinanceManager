Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "sessions" }
  root 'home#index'
  resources :users do
    resources :wallets
    resources :events
  end
  namespace :users do
    get "/events_calendar", to: 'users#events_calendar', as: :events
  end
end
