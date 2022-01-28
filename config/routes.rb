Rails.application.routes.draw do
  devise_for :users,
  controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do 
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end
  namespace :api, defaults: { format: :json } do
    resources :posts, only: [:create, :index] do
      resources :comments, only: [:create, :index]
    end
  end
end
