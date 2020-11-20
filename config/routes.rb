Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'static#home'
  get '/users/swoliest' => 'users#swoliest'
  get '/auth/facebook/callback' => 'session#create' #correct session naming convention to pluralize
  get '/signin', to: 'session#new'
  post '/signin', to: 'session#create'
  delete '/logout', to: 'session#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users, only: [:swoliest, :show, :index]
  resources :exercises
  resources :workouts do
    resources :workout_exercises, only: [:show, :index, :edit, :new, :delete]
  end

  resources :muscle_groups, only: [:index] do
    resources :exercises, only: [:show, :index, :new]
  end

  resources :workout_exercises
end
