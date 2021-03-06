Rails.application.routes.draw do
  root 'users#home'
  get '/signup' => 'users#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  post '/logout' => 'sessions#destroy'
  
 

  
  resources :schools do 
    resources :items
  end 
  
  resources :users
  

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
