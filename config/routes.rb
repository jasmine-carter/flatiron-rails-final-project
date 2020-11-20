Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'static#home'
  get '/auth/facebook/callback' => 'sessions#create' #correct session naming convention to pluralize
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  #resources :sessions do
    #collection do
      #get :signin
      #post :signin
      #delete :logout
    #end
  #end

  resources :users do
    collection do
      get :swoliest
    end
  end

  resources :exercises
  resources :workouts do
    resources :workout_exercises, only: [:show, :index, :edit, :new, :delete]
  end

  resources :muscle_groups, only: [:index] do
    resources :exercises, only: [:show, :index, :new]
  end

  resources :workout_exercises
end
