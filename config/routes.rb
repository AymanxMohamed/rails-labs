Rails.application.routes.draw do

  resources :posts # To all the routes for the posts controller

  # get 'posts/index'
  # get 'posts/new'
  # get 'posts/create'
  # get 'posts/edit'
  # get 'posts/update'
  # get 'posts/destroy'

  get 'register', to: 'auth#signup_form', as: 'register'
  post 'signup', to: 'auth#signup', as: 'signup'
  post 'signin', to: 'auth#signin', as: 'signin'
  get 'login', to: 'auth#signin_form', as: 'login'
  post 'logout', to: 'auth#logout', as: 'logout'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
end
