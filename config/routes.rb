Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, :controllers => { registrations: 'registrations', :omniauth_callbacks => "callbacks"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	get 'users/:id', to: 'users#show', as: 'user_profile'
	get 'reviews/:id', to: 'reviews#show', as: 'review_show'
	get 'reviews/:id/likes', to: 'reviews#like', as: 'review_like'
	get 'reviews/:id/comments/new', to: 'comments#new', as: 'new_review_comment'
	root 'companies#index'
  resources :companies do
  	resources :reviews , only: [:create, :new , :edit, :update, :destroy]
  end
  get '/search', to: 'search#index', as: 'search'
end
