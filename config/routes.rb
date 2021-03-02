Rails.application.routes.draw do
  root 'users#home'
  get '/signup' => 'users#new'
 
  
  
  resources :items
  resources :schools
  resources :users

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
