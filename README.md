# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example. The app utilizes Ruby on Rails for both the front end and the back end, Active Records for the Database, along with the Stripe API to accept payments and Cypress for testing. I made this while using Vagrant VM. I found that cypress testing didn't work well because of this. Anyway, enjoy the app!

Landing Page
<img src="/public/images/Screen%20Shot%202022-06-07%20at%206.33.18%20PM.png" />
Products selection on home page
<img src="/public/images/Screen%20Shot%202022-06-07%20at%206.33.28%20PM.png" />
Login Form
<img src="/public/images/Screen%20Shot%202022-06-07%20at%206.33.38%20PM.png" />
Cart
<img src="/public/images/Screen%20Shot%202022-06-07%20at%206.33.51%20PM.png" />

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `rails s -b 0.0.0.0` to start the server (If using Vagrant, you will need to make sure that you are in development mode when running the server. If you are not, run `rails s -e development -b 0.0.0.0`)

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
- Cypress
