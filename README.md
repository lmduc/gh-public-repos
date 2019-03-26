Live demo: https://gh-public-repos.herokuapp.com

## Development setup

1. Run `bundle install` to install all the gems

2. Copy `config/database.yml.example` to `config/database.yml`. Set/replace the ENV VAR by the corresponding configuration in your local machine.

3. Initialize the database and run migrations by the command: `rails db:create && rails db:migrate`

4. Start the rails server using `rails s`

## Test

1. Run migration for test environment `RAILS_ENV=test rails db:migrate`

2. Run all the tests `bundle exec rspec`
