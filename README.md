# Mazamas Climbs
[![Build Status](https://travis-ci.org/boennemann/badges.svg?branch=master)](https://travis-ci.org/boennemann/badges)

A Ruby on Rails web app to allow climbers to search and apply for Mazamas climbs, and to allow Mazamas climb leaders to browse applications and accept climbers on their outings. Capstone project for classroom portion of [Ada Developers Academy](https://www.adadevelopersacademy.org). Solo project built in 3.5 weeks.

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

## Entity relationship diagram
See the entity relationship diagram as a PDF [here](https://github.com/alyssahursh/mazamas/blob/master/erd.png)
![ERD](/erd.png?raw=true "ERD")


## Where can I see it?
Unfortunately, this web app is not currently running anywhere online. You'll have to download the repo and run a Rails server to interact with it locally. After downloading, run rake db:rebuild to seed the database.

## Project Backlog
[Trello board](https://trello.com/b/rIUWJbXU)

## Learning Lessons

