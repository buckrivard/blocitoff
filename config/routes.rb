Rails.application.routes.draw do

  get 'home/index'

	get 'profile', to: 'users#show'
  
  devise_for :users

  authenticated :user do
  	root 'users#show', as: :authenticated_root
  end

  root to: 'home#index'

end
