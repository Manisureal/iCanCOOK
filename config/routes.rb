Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :listings do
    resource :booking, only: [:new, :create]
    resource :review, only: [:new, :create]

end
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
