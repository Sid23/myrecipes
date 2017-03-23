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
end
