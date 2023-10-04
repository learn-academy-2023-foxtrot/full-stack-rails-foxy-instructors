## Full Stack Rails 10/4/23 Foxtrot

## Setup the empty repo
- Click the link for project

## Initial commit to main
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
- $ git pull origin main
- $ git checkout -b full-stack

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
- create a controller