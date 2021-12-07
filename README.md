# Chitter: A Twitter style Clone

## Description

This is a clone of the popular CRUD application Twitter. User can sign up, create posts or see previously made posts stored on a local SQL database. 

## Domain Model

<img alt="domain" src="public/images/domain_model.png" width="700">

## Usage/installation Instructions

Make sure you have ruby 2.7.3 installed

Clone the project into a directory using
```git clone project```

Install reequired gems
```bundle install```

## Set up the database
**Create Databases**
- Install and set up psql if required (Homebrew: brew install postgresql).
- Connect to psql via the Terminal
- Create the databases using the psql commands found inside db/database_installation.sql <br>

**Import tables**
- Connect to the development database using the pqsl command 
```\c chitter;```
- Sequentially run the queries saved in the db/migrations directory.
- Connect to the test database using the psql command 
```\c chitter_test;```
- Run queries saved inside db/migrations directory. 

## Technologies used

Ruby, RSpec, Sinatra, Capybara, HTML and Postgresql

## Testing/linting
Enter these commands into command line inside the main directory

For testing 
```rspec```  

For linting enter  
```rubocop```

### Learnings from project so far

This is my second attempt at this challenge and this is what I learned: <br>
How to create RESTful routes and why they are used <br>
Extracting responsibilities out of the controller and into the model of the system. This brings a separation of concerns <br>
Developing how the model works depending on the needs of the new feature <br>
Understanding of how system manages a session by storing user id inside sessions hash <br> 

### Still to do
Add Delete feature <br>
Add update feature <br>
show username underneath posts<br>
Add styling <br>
