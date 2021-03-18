Rails.application.routes.draw do
  root 'static#home'
  get '/signup' => 'users#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  post '/logout' => 'sessions#destroy'
  
 

  resources :users
  
  resources :schools do 
    resources :items 
  end 


  resources :items do 
    get 'donate' => 'items#donate', :on => :member
    post 'donate' => 'items#donated', :on => :member
  end 
  
  

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
