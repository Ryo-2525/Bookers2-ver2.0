Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  # フォローする
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'

  resources :users,only: [:show,:index,:edit,:update]

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments,only: [:create, :destroy]
  end

end