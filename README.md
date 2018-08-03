README.md

# Module One Final Project

## YELP API Data Manipulation

### Description

This is an overview of the steps taken to gather the data necessary to populate an Active Record database as well as manipulate the data and build a command line interface to perform methods on the collected data. The purpose of this CLI is to pull data from the Yelp database and provide restaurant options within walking distance of Flatiron School at WeWork's 708 Main Street, Houston campus.

### Create a Gem File

Ensure that the following Gems are called:
1. gem "sinatra-activerecord"
2. gem "sqlite3"
3. gem "pry"
4. gem "require_all"
5. gem "http"
6. gem "rest-client"


### Parsing Data into Ruby - Setup

1. Populate the database using using the Yelp Fusion API https://apilist.fun/i/yelp-fusion-api
2. Created a request to generate a new key token via Create New App at https://www.yelp.com/developers/v3/manage_app
3. Used Postman to GET https://api.yelp.com/v3/businesses/search as well as argument parameters (latitude, longitude, radius, etc) to pull data specific to this location of Flatiron School.


### Setting Up Folder Structure
1. In the app/models directory and touch restaurant.rb. Be sure to inherit from the ActiveRecord Database via < ActiveRecord::Base.
2. In the the bin directory and touch run.rb. Be sure to require_relative environment.rb in its appropriate folder.
  a. Be sure that the environment.rb includes the connection to the ActiveRecord Database.
3. In the db/migrate, run rake db:create_migration NAME=create_restaurants to create the first migration.
4. Use the change method and create_table method to add the following arguments from the Yelp database:
  a. name as a string
  b. alias as a string
  c. rating as a float
  d. price as a string
  e. transactions as a string
  f. address as a string
  g. phone as a string
5. After creating a migration table, save the file and run rake db:migrate. A schema should be created and populated with the appropriate table information.
6. In the db/migrate directory, touch seeds.rb. Use this file to parse the data from JSON into Ruby and to build all seeding methods.
7. Touch cli.rb into the main project folder to start building command line interface methods.

### Running the CLI
Run `ruby bin/run.rb` in Terminal to start the process. 


### IMPORTANT
Do not accidentally push API key to github.  
