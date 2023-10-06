## Full Stack Rails 10/4/23 Foxtrot

## helpful terminal commands
- To see a list of available routes: $ `rails routes -E`
- To stop server: `control + c`

## Setup the empty repo
***
Empty Github Repo - Only one team member performs these actions.
***
- Click on the project link in the slack channel
- Create team name and accept the assignment
- An empty github repo will be available  
***NOTE: Do not clone this repo. This repo is meant to store the separate rails app that you will create.***

## Initial commit to main branch
***
Rails App - Only one team member performs these actions.
***  
***NOTE: Ensure you are not inside of a github repo when creating the rails app.***  
- $ `rails new full-stack -d postgresql -T`
- $ `cd full-stack`
- $ `rails db:create`  
***NOTE: You will copy and paste the `git remote add origin` command from your empty github repo.***  
- Connect empty github repo with the local repo: $ git remote add origin https://github.com/learn-academy-2023-foxtrot/full-stack-rails-foxy-instructors.git
- $ `git status`
- Ensure that you want to add all the files and folders: $ `git add .`
- $ `git commit -m "initial commit"`
- $ `git branch -M main`
- $ `git push origin main`
- $ `rails s`

## Switching Drivers
- Join the github classroom team
- Clone the github repo for your team
- Create the empty database
- Migrate all the changes
- Add all dependencies: $ `bundle`
- Either create a new branch or fetch an existing branch
- Code!
***NOTE: You will have to stub more data entries in the rails console because the database is on saved locally .***  

## MVP
- minimum viable project: what needs to be provided to get a basic functioning application
- Header text --> Business Reviews From the Fox Crew
- Purpose --> to provide reviews of businesses (CreamWave, Elite Cleaning Service, Box Surf)

### User stories and work flow (create a branch for each feature you are contributing to the team's code)
1) Allow a user to see all the data in the database --> index  
2) Allow a user to see more information about a single data entry --> show  
3) Allow a user to create data entries --> new, create  
4) Modify the following files and folders in this order:  
  a) Controller  
  b) Routes  
  c) Views  

## Full Stack Process
- Follow the process to setup empty repo and perform initial commit
- Create a new branch to perform the following: 
  - add all dependencies
    - $ bundle add rspec-rails
    - $ rails generate rspec:install
  - create a model
    - $ rails g model Business name:string description:string team:string star_rating:integer
  - save changes to the schema
    -  rails db:migrate
  - create a controller
    - $ rails g controller Business
  - create some data entries (stubbing some data for development purposes)  
    - $ rails c
    - > Business.create(name: 'CreamWave', description: 'microwave with ice cream tub', team: 'Shake and Bake', star_rating: 5)
- Create a new branch for each restful route process

## index (read -> get -> index)
- Allow a user to see all the data in the database    
  a) Controller: app/controllers/business_controller.rb  
    - method name will be the restful route index
    - stores the active record query on an instance variable that will display all the data entries in the database
```rb
      def index
        @businesses = Business.all
      end
```  
  b) Routes: config/routes.rb  
  ***NOTE: The order that restful routes need to be place on the routes.rb is INCSEUD (ink-say-ud): index, new, create, show, edit, update, destroy.***
    - define the url with http verb `get` and map to the applicable controller and its method `business#index`
```rb
      get '/businesses' => 'business#index'
```  
  c) Views: app/views  
    - will send back the response that will display all the data entries
    - Since the active record query returns an array, we will iterate across the values and display each instance as a separate line item.
    - create the `.html.erb` file which will be named after the method
    - use erb tags <% %> when you don't want to display the data stored in an instance variable 
    - use erb tags <%= %> when you don't want to display the data stored in an instance variable 

## show (read -> get -> show)
- Allow a user to see more information about a single data entry  
  a) Controller  
    - method will be called show
    - active record query will store one instance based on id param
```rb
    def show
      @business = Business.find(params[:id])
    end
```  
  b) Routes  
    - define the url with http verb `get` and map to the applicable controller and its method `business#show`
```rb
      get '/businesses' => 'business#show'
```  
  c) Views  
    - to display all the attributes for one instance
    - create show.html.erb which will display all the values for each attribute(key)

## new and create
- Allow a user to create data entries (2 steps)
- to save a new instance to the database, we need to provide an html form to collect the user's input (new) and then save those attributes as a new instance to the database (create)

### new (read -> get -> new)  
  a) Controller  
    - method will be called new
    - using new built-in method to allow a user to assign values to the different attributes presented on the html form
```rb
      def new
        @business = Business.new
      end
```  
  b) Routes  
    - define the url with http verb `get` and map to the applicable controller and its method `business#new`
```rb
    get '/businesses/new' => 'business#new'
```  
  c) Views  
    - to display an empty html form with labels named as key of each value in an instance
    - create new.html.erb which will use form_with helper method, which creates a form that will reference the attributes for each instance in the database
    - form_with helper method with use builtin methods to state what values to assign to each attribute in the data entry by referencing the instance variable and each attribute(key)
    - a submit button will also be created from the built-in methods from the helper method
```rb
    <h3>Add a New Business Review</h3>
    <%= form_with model: @business do |form| %>

      <%= form.label :name %>
      <%= form.text_field :name %>

      <br>
      <%= form.label :description %>
      <%= form.text_field :description %>

      <br>
      <%= form.label :team %>
      <%= form.text_field :team %>

      <br>
      <%= form.label :star_rating %>
      <%= form.text_field :star_rating %>

      <br>
      <%= form.submit 'Add Business Review' %>
    <% end %>
```

### create (create -> post -> create)
  a) Controller  
    - method will be called create
    - using create built-in method to save a new instance to the database based on the values given to the html form
    - create restful route will be use strong params to control how to user interacts with the database using the following:
      - private: prevents access to certain data/methods across the application
      - strong params: method listed as private to control what attributes can be created by the user
      - params.require: establishes which model will have the requirements
      - .permit(): establishes which attribute the user can provide
```rb
    def create
      @business = Business.create(business_params)
    end

    private
    def business_params
      params.require(:business).permit(:name, :description, :team, :star_rating)
    end
```  
  b) Routes  
    - define the url with http verb `post` and map to the applicable controller and its method `business#create`
```rb
    post '/businesses' => 'business#create'
```  
  c) Views  
    - no file needed because create restful route will be saving new instance to the database
    - to verify that a new instance was saved to the database, just pass the url for the index restful route

## Stretch Goals

## update an existing entry
- to modify an existing instance in the database, we need to provide an html form that shows the current values that can be changed (edit) and then save those changes to the instance (update)
### edit
read -> get -> edit
a) controller: contains the edit method that will specify which instance to display on the html form
```rb
  def edit
    @business = Business.find(params[:id])
  end
```
b) routes: defines the url with `get` and calls the edit method
```rb
  get '/businesses/:id/edit' => 'business#edit'
```
c) views:
  - to display an empty html form with labels named as key of each value in an instance
***
  Older, softly deprecated method form_for
  `<%= form_for @business, url: show_business_path(@business), method: :patch do |form| %>`
  - create edit.html.erb which will use form_for helper method, which creates a form that will reference the attributes for each instance in the database
  - form_for helper method with options 
  - form_for helper method will use builtin methods to state what values to assign to each attribute in the data entry by referencing the instance variable and each attribute(key)
  - a submit button will also be created from the built-in methods from the helper method  
***
  Newer method form_with
  - aliases will be created for routes to show and edit, show will be assigned the alias `business` because the form_with will be searching for a business_path
```rb
  get '/businesses/:id' => 'business#show', as: 'business'
  get '/businesses/:id/edit' => 'business#edit', as: 'edit_business'
```
  - link will be created on the show.html.erb to route to the edit form
```rb
  <%= link_to 'Edit this Review', edit_business_path(@business) %>
```
  - form_with will have similar use as on the new.html.erb, we just have to add the options for the method to perform the patch http verb
```
  <%= form_with model: @business, method: :patch do |form| %>
```

### update
update -> patch/put -> update  
a) controller: contains the update method that will save the changes to the database
```rb
  def update
    @business = Business.find(params[:id])
    @business.update(business_params)
  end
```
b) routes: defines the url with `patch` and calls the update method
- also uses strong params, as well as a params id to specify which entry is being updated
```rb
  patch '/businesses/:id' => 'business#update'
```
- views: no file needed, update RESTful route is saving the modifications

## delete an entry


- links to the different pages

<%= form_for @business, url: show_business_path(@business), method: :patch do |form| %