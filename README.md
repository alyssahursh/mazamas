# Mazamas Climbs
[![Build Status](https://travis-ci.org/boennemann/badges.svg?branch=master)](https://travis-ci.org/boennemann/badges)

A Ruby on Rails web app to allow climbers to search and apply for Mazamas climbs, and to allow Mazamas climb leaders to browse applications and accept climbers on their outings. The goal was to create an applciation to replace an existing paper-and-mail process. Capstone project for classroom portion of [Ada Developers Academy](https://www.adadevelopersacademy.org). Solo project built in 3.5 weeks. I gave a brief talk about this project at Amazon on January 27th, 2017 and at [Seattle.rb](http://www.seattlerb.org/) on March 7th, 2017.

## Desktop
![Desktop screen shots](/mazamas-desktop.png?raw=true "Desktop screen shots")

## Mobile
![Phone screen shots](/mazamas-phone.png?raw=true "Phone screen shots")

## Technologies
* Primary language: Ruby 2.3.1
* Framework: Rails 4.7.2
* Database: PostgreSQL
* Testing: Minitest
* Continuous Integration: [Travis CI](https://travis-ci.org/)
* Map API: [MapBox](https://www.mapbox.com/)
* Payments: [Stripe](https://www.stripe.com)
* User Authentication: [Devise](https://github.com/plataformatec/devise)
* Deployed on AWS with EC2 and RDS
* SSL Certificate through AWS

## Entity relationship diagram
See the entity relationship diagram as a PDF [here](https://github.com/alyssahursh/mazamas/blob/master/erd.png)
![ERD](/erd.png?raw=true "ERD")

## Where can I see it?
Unfortunately, this web app is not currently running anywhere online. You'll have to download the repo and run a Rails server to interact with it locally. After downloading, run rake db:rebuild to seed the database. (The database seeds were scraped from two existing websites. See the [scraper repo](https://github.com/alyssahursh/mazamas-scraper) for more information on how the data was collected.)

To log in as a user, use climber10@mazamasclimbs.org or leader10@mazamasclimbs.org. The password for all test users is "password".

## Completed user stories
* Users can search the mountain database and get summit coordinates, elevation, and route information for any mountains the Mazamas climb. The mountain detail page shows a topo map of the mountain, zoomed in to the summit at a level based on the mountain's elevation.
* Users can search the climb schedule for climbs they would like to apply for. They can apply to a climb by paying an application fee through Stripe.
* Users can check their Mazamas membership status, and manage their membership renewal through Stripe.
* Users can update their climb resume (and leader profile if applicable).

## Project backlog
It's a long list. See the full [Trello board](https://trello.com/b/rIUWJbXU)

## Learning Lessons
* My biggest take away from working on this project was how much I prefer coding with a team. Working alone for 3+ weeks was tedious, and I didn't like being alone in my own head for that long. I found it very hard to talk myself out of allowing scope creep, and I struggled in being accountable only to myself. I would much rather work on components of a larger project with a partner or small team; to have someone else deep in the weeds with me. Code is meant to be written with others.
* Paper processes seem inherently easy to replace with code, because it's easy to ignore all of the human decision-making that goes into moving paper around. This web application is designed to replace a single paper form and a basic table of climbs. Even 3+ weeks of work wasn't enough to code all the complexity baked into one paper form. I knew that going into the project, but I'm still surprised at how much work is left.
