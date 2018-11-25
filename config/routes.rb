Rails.application.routes.draw do
  resources :modifications
  resources :servers
  resources :users

  root 'sessions#new'
  
  get '/modification', to: 'modifications#new'
  
  get '/admin',    to: 'static_pages#admin'
  get '/employee',  to: 'static_pages#employee'
  root 'sessions#new'
  
  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  get '/dashboard',  to: 'dashboard#index'
  get '/approved', to: 'servers#approved'
  get '/pending', to: 'servers#pending'
  get '/server', to: 'server#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
