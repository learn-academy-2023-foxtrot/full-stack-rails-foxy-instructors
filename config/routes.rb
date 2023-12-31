Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # index, new, create, show, edit, update, destroy
  # all the instances
  root 'business#index'
  # new instance
  get '/businesses/new' => 'business#new', as: 'new_business'
  post '/businesses' => 'business#create'

  # one instance
  get '/businesses/:id' => 'business#show', as: 'business'
  
  # update instance
  get '/businesses/:id/edit' => 'business#edit', as: 'edit_business'
  patch '/businesses/:id' => 'business#update'

  # delete instance
  delete '/businesses/:id' => 'business#destroy', as: 'destroy_business'

end
