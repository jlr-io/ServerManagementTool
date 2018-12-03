Rails.application.routes.draw do
  resources :tickets
  resources :servers
  resources :systems
  resources :users
  
  
  get '/admin',    to: 'static_pages#admin'
  get '/employee',  to: 'static_pages#employee'
  root 'sessions#new'  
  
  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  get '/dashboard',  to: 'dashboard#index'
  
  post '/server_search', to: 'servers#search'
  post '/ticket_search', to: 'tickets#search'
  post '/user_search', to: 'users#search'
  post '/accepted_search', to: 'tickets#accepted'
  post '/unaccepted_search', to: 'tickets#unaccepted'
  post '/approved_search', to: 'servers#approved_search'
  
  get '/approved', to: 'servers#approved'
  get '/pending', to: 'servers#pending'

  get '/create', to: 'servers#new'
  get '/ticket', to: 'tickets#new'
  
  get '/server', to: 'server#new'
  get '/servers', to: 'servers#index'
  
  get '/accepted', to: 'tickets#accepted'
  get '/unaccepted', to: 'tickets#unaccepted'
  
  get '/system', to: 'system#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
