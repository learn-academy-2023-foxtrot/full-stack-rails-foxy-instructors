Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # all the instances
  get '/businesses' => 'business#index'

  # new instance
  get '/businesses/new' => 'business#new'
  post '/businesses' => 'business#create'

  # one instance
  get '/businesses/:id' => 'business#show', as: 'show_business'
  
  # update instance
  get '/businesses/:id/edit' => 'business#edit', as: 'edit_business'
  patch '/businesses/:id' => 'business#update'

end
