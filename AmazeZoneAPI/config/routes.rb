Rails.application.routes.draw do
  resources :transactions

  post '/auth/login', to: 'auth#login'

  get '/auth/current', to: 'auth#current'

  post '/signup', to: 'users#create'

  resources :products
  
  resources :credit_cards
end
