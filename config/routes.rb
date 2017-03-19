Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations', :omniauth_callbacks => "callbacks"}

	root 'companies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies


  get '/companies/search', to: 'search#index', as: 'search'
end
