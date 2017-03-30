Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#home"
  get 'pages/home', to: 'pages#home'
  get 'pages/about', to: 'pages#about'
  
  get '/recipes', to: 'recipes#index'
  get '/recipes/new', to: 'recipes#new'
  post '/recipes/', to: 'recipes#create'
  get '/recipes/:id', to: 'recipes#show', as: 'recipe'
  get '/recipes/edit/:id', to: 'recipes#edit', as: 'recipe_edit'
  patch '/recipes/:id', to: 'recipes#update'
  put '/recipes/:id', to: 'recipes#update'
  delete '/recipes/:id', to: 'recipes#destroy'

  get '/signup', to: 'chefs#new'
  # Because the chef creation is managed by the signup page
  resources :chefs, except: [:new]

  # Routes for login
  get '/login', to: 'sessions#new'
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  # Routes for ingredient
  # They cannot be deleted, and can be modified only by admin users
  resources :ingredients, except: [:destroy]

  #nested route
  resources :recipes do
    resources :comments, only: [:create]
  #post '/recipe/:id/comments', to: "comments#create", as: "recipe_comments"
  end

  post '/recipe/:id/like', to: "recipes#like", as: "like_recipe"

  # Route for ActionCable server
  mount ActionCable.server => '/cable'
end
