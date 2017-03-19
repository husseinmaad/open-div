Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations', :omniauth_callbacks => "callbacks"}
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	get 'users/:id', to: 'users#show', as: 'user_profile'
	root 'companies#index'
  resources :companies do
  	resources :reviews , only: [:create, :new , :edit, :update]
  end
  
end
