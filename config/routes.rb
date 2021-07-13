Rails.application.routes.draw do
  root 'posts#index'
  
  devise_for :users

  resources :users

  post '/:id/follow', to: 'users#follow', as: 'user_follow'
  delete '/:id/unfollow', to: 'users#unfollow', as: 'user_unfollow'

  get '/:id/followings', to: 'users#followings', as: 'user_followings'
  get '/:id/followers', to: 'users#followers', as: 'user_followers'

  resources :posts do
    resources :comments
  end
end
