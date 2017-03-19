Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations', :omniauth_callbacks => "callbacks"}
  
	root 'users#index'
	get 'users/:id', to: 'users#show', as: 'user_profile'
	resources :company , except: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
