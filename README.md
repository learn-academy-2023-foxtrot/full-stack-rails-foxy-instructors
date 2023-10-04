## Full Stack Rails 10/4/23 Foxtrot

## Setup the empty repo
***
Empty Github Repo - Only one team member performs these actions.
***
- Click on the project link in the slack channel
- Create team name and accept the assignment
- An empty github repo will be available
***NOTE: Do not clone this repo. This repo is meant to store the separate rails app that you will create.***

## Initial commit to main
***
Rails App - Only one team member performs these actions.
***
***NOTE: Ensure you are not inside of a github repo when creating the rails app.***
- $ rails new full-stack -d postgresql -T
- $ cd full-stack
- $ rails db:create
- Connect empty github repo with the local repo: $ git remote add origin https://github.com/learn-academy-2023-foxtrot/full-stack-rails-foxy-instructors.git
- $ git status
- Ensure that you want to add all the files and folders: $ git add .
- $ git commit -m "initial commit"
- $ git branch -m main
- $ git push origin main
- $ rails s

## MVP
- minimum viable project: what needs to be provided to get a functioning application
- Business Reviews From the Fox Crew
- to review the the CreamWave, Elite Cleaning Service, Box Surf
1) Allow a user to see all the data in the database --> index
2) Allow a user to see more information about a single data entry --> show
3) Allow a user to create data entries --> new, create
4) Modify the following files and folders in this order:
  a) Controller
  b) Routes
  c) Views

## Full Stack Process
- add all dependencies
- create a model
  - $ rails g model Business name:string description:string team:string star_rating:integer
- create a controller
  - $ rails g controller Business
- create some data entries
  - $ rails c
  - > Business.create(name: 'CreamWave', description: 'microwave with ice cream tub', team: 'Shake and Bake', star_rating: 5)

## index
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

## show
- Allow a user to see more information about a single data entry
  a) Controller
    - method will be called show
    - active record query will store one instance based on id param
  b) Routes

  c) Views
    - to display all the attributes for each instance

## new and create
- Allow a user to create data entries 
  a) Controller
  b) Routes
  c) Views
  - form_with helper method: creates a form that will reference the attributes for each instance in the database
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