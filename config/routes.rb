Rails.application.routes.draw do
  
  devise_for :users, :path => 'accounts'

  resources :users, only: [] do
  	resources :items, only: [:create, :new, :destroy]
  end

  authenticated :user do
  	root 'users#show', as: :authenticated_root
  end

  root to: 'home#index'

end
