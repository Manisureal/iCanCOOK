Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  get 'dashboard', to: 'pages#dashboard'
  get 'confirm', to: 'pages#confirm'
  resources :conversations do
  resources :messages
 end
  resources :profiles, only: [:edit, :update]
  resources :listings do
    resources :bookings, only: [:new, :create] do
       resources :payments, only: [:new, :create]
    end
    resources :reviews, only: [:new, :create]
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
