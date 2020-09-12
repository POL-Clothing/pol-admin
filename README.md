# Material Instinct LLC - DNA Boilerplate for Admin UI

Running the app locally (w/o Docker):

Requirements: ruby 2.6.2, rails 5.2.2, Postgres

1. Clone this repo
1. Copy `.env.example` to `.env.development`
1. Copy app secrets from shared Dashlane.app secure note into `.env.development`
1. Create a local postgres database (dev & test)
1. Create a local postgres user: `CREATE USER psycle_admin;`
1. `ALTER USER <user> WITH SUPERUSER;`
1. `GRANT ALL PRIVILEGES ON DATABASE <db> TO <user>;`
1. `GRANT USER <user> WITH LOGIN;`
1. Make sure the database creds match those in `.env.development`
1. Run `bundle install`
1. Run `rails g spree:install --user_class=Spree::User` (say "no" to all overwrites)
1. Run `rails g spree:auth:install` (say "no" to all overwrites)
1. Run `rails g spree_gateway:install`
1. Run `rake db:schema:load`
1. Run `rake db:seed`
1. Run `rake spree_sample:load`
1. Run `rails s`

If you need to reset your local DB:

1. Run `rake db:reset`
1. Run `rake railties:install:migrations`
1. Run `rake db:migrate`
1. Run `rake db:seed`
1. Run `rake spree_sample:load`

---

Other things we may need to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
