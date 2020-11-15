Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'static#home'
  resources :users
  resources :exercises
  resources :workouts do
    resources :workout_exercises, only: [:show, :index, :edit, :new]
  end

  resources :workout_exercises
  get '/signin', to: 'session#new'
  get '/destroy', to: 'session#destroy'
  post '/signin', to: 'session#create'
end
