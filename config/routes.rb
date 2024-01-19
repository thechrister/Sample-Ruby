Rails.application.routes.draw do
  devise_for :users
  resources :friends
  get "home/about"
  root "friends#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
