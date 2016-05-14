Rails.application.routes.draw do
  get 'top/index'

  root 'top#index'
  namespace :api, default: {format: :json} do
    resources :users, only: [:create] do
      member do
        resources :notices, only: [:index]
        post   'follow'
        delete 'unfollow'
        get    'following'
        get    'followers'
        get    'is_follow'
      end
    end
    resources :blogs, only: [:index, :create, :show] do
      collection do
        get 'following'
        get 'search'
      end
      resources :likes, only: [:create, :destroy] do
        collection do
          get   'is_like'
        end
      end
    end
    resources :images, only: [:create]
    resources :texts, only: [:create]
  end
end
