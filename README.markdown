#Kalahari
[![Dependency Status](https://gemnasium.com/36e7dab32cc3815dda503d0aea684978.svg)](https://gemnasium.com/a0e11a8627a54875e108565ed8756ff2)

###Technology Stack
* Ruby 2.1.1-p76
* Rails 4.1
* Rails-API 0.2.0
* Postgres 9.3

###Tasks
* Run 'foreman start' to start the server and go to http://localhost:5000
* Run 'foreman run rails c' to start the rails console
* Run 'foreman run rspec' to run your test suite

###Setup
* rvm install ruby 2.1.1-p76
* rvm use --default ruby 2.1.1-p76
* Install the Mac Postgres App http://postgresapp.com/ and set it to automatically start on login
* Add export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH" to .profile in your root (~) directory
* Restart your machine
* type 'which psql' which should return something like '/Applications/Postgres.app/Contents/MacOS/bin/psql'
* Clone this repository
* Get the .env file that is not in git from a team member
* Gem install foreman
* Run bundle
* Run 'rake db:create db:migrate db:seed' and 'RAILS_ENV=test rake db:create db:migrate db:seed'
* Run 'foreman run rspec' and all tests should pass
