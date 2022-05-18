Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

scope '/questions' do
  get '/all' ,to: 'ask#index'
  post '/ask' ,to:'ask#create'
  get'/question/:id', to:'ask#show'
  put'/ask/:id', to:'ask#update'
  delete'/ask/:id', to:'ask#delete'
end



  scope '/auth' do
    post'/sign_up',to: 'users#create'
    post'/sign_in',to: 'users#sign_in'

  end
end
