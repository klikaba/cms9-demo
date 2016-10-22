Rails.application.routes.draw do
  devise_for :users

  authenticate :user do
    mount Cms9::Engine => '/cms9' # or DEF_ROUTE where your Cms9 route is mounted
  end

  root 'posts#index'

  resources :posts, only: [:index, :show]
end
