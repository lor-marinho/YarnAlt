Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :yarns, only: [:index, :show] do
    resources :favourites, only: [:new, :create]
    resources :chatrooms, only: [:new, :create, :show] do
      resources :messages, only: :create
    end

    member do 
      delete :favourites, to: "favourites#destroy"
    end
  end
  resources :users, only: :show

  resources :messages, only: :destroy
end
