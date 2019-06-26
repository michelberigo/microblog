Rails.application.routes.draw do
  mount Notifications::Engine => "/notifications"
	devise_for :users

	get '/dashboard', to: 'users#dashboard'
	resources :users do
		member do
			get :following, :followers
		end
		
		resources :posts, except: [:index]
	end

	resources :posts, except: [:index] do
		resources :comments
	end
	
  resources :relationships, only: [:create, :destroy]
	
	root 'users#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
