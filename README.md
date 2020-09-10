# README

## Getting Started
* Ruby version
Ruby: 2.6.6

* System dependencies
Node: stable/12.18.3 (as of 9 Sep 2020)

* Configuration
Download.
Ensure dependencies set.
Make sure postgresdb on.
`bundle install`

* Database creation
`rails db:create`

* Database initialization
`rails db:migrate`
`rails db:seed`

Once all successful
`rails s`
Navigate to `localhost:3000`

* How to run the test suite
Features (not well maintained) `bundle exec cucumber`
Rspec `bundle exec rspec`

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
`heroku login`
`git push heroku master`
`heroku run rake db:seed` if `seeds.rb`.updated?