Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'static#home'
  resources :users
  resources :exercises
  resources :workouts do
    resources :workout_exercises, only: [:show, :index, :edit, :new]
  end

  get '/auth/facebook/callback' => 'session#create' #correct session naming convention to pluralize

  resources :workout_exercises
  get '/signin', to: 'session#new'
  delete '/logout', to: 'session#destroy'
  post '/signin', to: 'session#create'
end
