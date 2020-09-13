# README
## What is it?
Mousehunt is a game on facebook which is kinda as simple as it sounds. You, the hunter have a trap that you arm and every 15 mins you get the chance to 'hunt' and see what you catch. One of the main features of the game is the rich graphical content and continual release of new areas and items to collect. One of the challenges of the game is learning what is available in each area and then collecting the necessary items. The app also presents a challenge of not having a well developed UI to sort items already owned in a meaningful manner.

Main user story: As a mousehunt player, I want an app to track my weapons and special items so that I can know what I have yet to get and how to get it.

## Upcoming features in planning
- Item ExchangeGains and ExchangeCosts to handle the many ways of obtainings items in the game, such as purchasing, crafting, brewing.
- Purchase Locations and Drop Locations
- User can track weapons, bases and collectibles as personal inventory
- Item acquisition detail page
- Formally split UI into CMS of game info and User App that only displays it all


## Upcoming next few days
- Finishing up Feature: Basic Items
  - Need to remove ItemStats table and save that info direct on Item, with create/update controls on whether or not stats req'd
  - Then create two custom forms: for Items with stats and without
  - This solves the stats on edit bug
  - Add some details on list views, make sure things capitalized and spaced
- Once POC stable with Items, catalog current features and rewrite the cucumber files and request specs accordingly before it gets too big

## Updates
  - Sat, Sept 12, changed items add into a quickadd form only for each category, can put stats in on edit.
  - Friday's reset: 
    - Ended up creating a table for category instead of enum, rewired specs, controllers, views. 
    - Tested out rails routes for like an hour, learned a bit there. 
    - Custom routes for each item category as an index page since soo many items. 
    - Next up is to finish wiring in additional forms on the show pages to add items from there directly.
  - In progress Thurs, Sep 10 - Items created, starting stats table for weapons
    - ended up down a shoulda matchers docs hole at one point, but they rock
  - Wed progress: 
    - Added Mice and MiceLocations. 
    - Nested routes avail to add a mice location from either the mouse or the location as long as both exist. 
    - FactoryBot rules! 
    - Also, there are now Regions too just to make pretty tables.
  - Tues progress: 
   - User's have ranks, added Locations. 
   - Basic RSpecs for red/green/refactor later. 
  - Monday's work: Add ranks and some basic styling
  - Sep 6, Sunday's setup: I have an app, it has a user. Feature work in Cucumber, testing in RSpec.

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