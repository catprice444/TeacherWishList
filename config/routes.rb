Rails.application.routes.draw do
  root 'users#home'
  get '/signup' => 'users#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  post '/logout' => 'sessions#destroy'
  
  get '/items/donate' => 'items#donate'
  post '/items/donate' => 'items#donated'

  
  resources :schools do 
    resources :items
  end 
  resources :users
  resources :items

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
