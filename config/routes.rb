Rails.application.routes.draw do
  mount Cms9::Engine => '/cms9'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :posts, only: [:show]
 
  get  '/blogs',   to: 'home#blogs'
  get  '/careers',   to: 'home#careers'
  get  '/posts',   to: 'home#posts'


end
