Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#waitforit'
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
  resources :favourites, only: :destroy
  resources :gauge_swatches, only: [:new, :create, :show, :index] do
    collection do
      get :my_gauges
    end
  end
  resources :messages, only: :destroy
end
