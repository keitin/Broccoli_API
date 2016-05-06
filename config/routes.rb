Rails.application.routes.draw do
  get 'top/index'

  root 'top#index'
  namespace :api, default: {format: :json} do
    resources :users, only: [:create] do
      member do
        post   'follow'
        delete 'unfollow'
        get    'following'
        get    'followers'
        get    'is_follow'
      end
    end
    resources :blogs, only: [:index, :create, :show]
    resources :images, only: [:create]
    resources :texts, only: [:create]
  end
end
