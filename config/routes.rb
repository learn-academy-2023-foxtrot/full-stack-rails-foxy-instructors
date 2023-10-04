Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # all the instances
  get '/businesses' => 'business#index'
  # one instance
  get '/businesses/:id' => 'business#show'
end
