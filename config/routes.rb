Rails.application.routes.draw do
  
  get 'mypage/edit'
  put 'mypage/update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
  resources :comments, only: [:create, :destroy]
  end
  
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  #get "/posts/test", "posts#test"

  root 'posts#index'
  devise_for :users


end