Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]

  resources :bikes, only: [:index, :new, :create, :show] do
    resources :reservations, only: :create, shallow: true
  end

  resources :reservations, only: :index
end
