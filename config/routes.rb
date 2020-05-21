Rails.application.routes.draw do
  root to: 'pages#home'
  get '/me', to: 'users#me'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get 'post', to: 'users#show'
end
