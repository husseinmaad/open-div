Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, :controllers => { registrations: 'registrations', :omniauth_callbacks => "callbacks", :users => "users"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	get 'users/:id', to: 'users#show', as: 'user_profile'
	get 'reviews/:id', to: 'reviews#show', as: 'review_show'
	post 'reviews/:id/likes', to: 'reviews#like', as: 'review_like'
  delete 'reviews/:review_id/likes/:id', to: 'reviews#unlike' , as:'review_unlike'
	get 'reviews/:id/comments/new', to: 'comments#new', as: 'review_comments'
	post 'reviews/:id/comments/new' , to: 'comments#create', as: 'new_review_comments'
  get 'reviews/:review_id/comments/:id/edit', to: 'comments#edit', as: 'edit_comment'
  put 'reviews/:review_id/comments/:id', to: 'comments#update', as: 'review_comment'
  delete 'reviews/:review_id/comments/:id', to: 'comments#destroy'
  post 'comments/:id/likes', to: 'comments#like', as: 'comment_like'
  delete 'comments/:comment_id/likes/:id', to: 'comments#unlike' , as:'comment_unlike'
  root 'companies#index'
  # resources :comments , only: [:create,:edit,:update,:destroy]
  get '/search', to: 'search#index', as: 'search'

  resources :companies do
  	resources :reviews , only: [:create, :new , :edit, :update, :destroy]
  end

end
