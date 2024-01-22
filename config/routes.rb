Rails.application.routes.draw do
  devise_for :users
  resources :friends

    # patch "upload_file"
  # patch 'upload_file', to: 'friends#upload_file', on: :member, as: 'upload_file'
  get "home/about"
  root "friends#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
