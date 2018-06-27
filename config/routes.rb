Rails.application.routes.draw do
  post "likes/:id/create" => "likes#create"
  post "likes/:id/destroy" => "likes#destroy"

  post "ideas/comment" => "ideas#comment"
  post "comment/:id/destroy" => "comment#destroy"

  get 'users/index'
  get 'users/show'
  get "users/:id/likes" => "users#likes"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :ideas
  get "/" => "ideas#top"
  get "/about" => "ideas#about"
  root 'post_images#index'
  resources :users, :only => [:index, :show]
  resources :ideas, only: [:new, :create, :index, :show]
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
end
