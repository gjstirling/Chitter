# Chitter: A Twitter style Clone

## Description

This is a clone of the popular CRUD application Twitter. User can sign up, login, create posts and see previously made posts stored on a local SQL database. User must have an account to login but does not need an account to view posted peeps.

A demonstration of this application can be found [here](https://www.loom.com/share/440eefd168ff4af490355fe783c43f07).

## Domain Model

<img alt="domain" src="public/images/domain_model.png" width="700">

## Installation Instructions

Install ruby 2.7.3 <br>
```brew install ruby 2.7.3```

Clone the project into a directory using <br>
```git clone https://github.com/gjstirling/Chitter.git```

Install required gems <br>
```bundle install```

## Usage Instructions

- Start server using ```rackup -p 3000```
- Visit http://localhost:3000/ in your browser
- Click 'sign_up' 
- Enter your details into the form 
- You can now login by clicking 'Login'
- Posts can be viewed or added 
- At the end of the session click 'sign_out' to end the session

## Set up the database
**Create Databases**
- Install and set up psql if required (Homebrew: brew install postgresql).
- Connect to psql via the Terminal
- Create the databases using the psql commands found inside db/database_installation.sql <br>

**Import tables**
- Connect to the development database using the pqsl command <br>
```\c chitter;```
- Sequentially run the queries saved in the db/migrations directory.
- Connect to the test database using the psql command <br> 
```\c chitter_test;```
- Run queries saved inside db/migrations directory. 

## Technologies used

Ruby, RSpec, Sinatra, Capybara, HTML and Postgresql

## Testing/linting
**Enter these commands into command line inside the main directory:**

For testing <br>
```rspec``` <br>

For linting enter  
```rubocop```

## Learnings from project so far

This is my second attempt at this challenge and this is what I learned: <br>
How to create RESTful routes and why they are used <br>
Extracting responsibilities out of the controller and into the model of the system. This brings a separation of concerns <br>
Developing how the model works depending on the needs of the new feature <br>
Understanding of how system manages a session by storing user id inside sessions hash <br> 

### Features to add
Add Delete feature <br>
Add update feature <br>
show username underneath posts<br>
Scale app for mobile use <br>
