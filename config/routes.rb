Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :yarns, only: [:index, :show]
  resources :users, only: :show do
    resources :favourites, only: [:new, :create]
  end
  resources :favourites, only: :destroy
end
