# Timeliner [![Build Status](https://travis-ci.org/karimmtarek/timeliner.svg)](https://travis-ci.org/karimmtarek/timeliner) [![Code Climate](https://codeclimate.com/github/karimmtarek/timeliner/badges/gpa.svg)](https://codeclimate.com/github/karimmtarek/timeliner) [![Test Coverage](https://codeclimate.com/github/karimmtarek/timeliner/badges/coverage.svg)](https://codeclimate.com/github/karimmtarek/timeliner/coverage)

Timeliner is an open-source, free to use web application aims to help web developers and designers create a one good-looking portfolio page, quick and easy.

## Use case
You need a portfolio or just a unique online resume, you need to add some basic information about your self and what you do. You need it look good, you don't have time to build it from scratch and you don't want to buy a template for $10 and hack into it because again you don't have that, and you don't want to pay for fancy online service, if you do please check the **Fancy online services** list.

## Fancy online services
TBC

## Demo
TBC

## Installation
1. Fork the app
2. Run `bundle install` in the root directory
3. Make sure that Postgresql is installed and you have an account setup
4. Create `config\database.yml` and fill it, you can see the sample file `config\database.sample.yml` for reference.
5. Create `config\application.yml` and fill it, you can see the sample file `config\application.sample.yml` for reference.
6. Alternatively, create `.env` and fill it, you can see the sample file `.env.sample` for reference.
6. Run `rake db:create db:migrate`

## Coding style guides

### Ruby
- [Ruby coding style guide](https://github.com/bbatsov/ruby-style-guide)

### Rails
- [Ruby on Rails 4 style guide](https://github.com/bbatsov/rails-style-guide)

### Front-end
- [Code Guide](http://codeguide.co/)
- [Sass Guidelines](http://sass-guidelin.es/)

### Docker
- Install [docker](https://www.docker.com)
- Install [docker-compose](https://docs.docker.com/compose)
- Run `docker-compose build` to build the image from the specified Dockerfile.
- Run `docker-compose run web rake db:create db:migrate` once to build the database.
- Run `docker-compose up -d` to launch the app.
- Navigate to [localhost:3000](http://localhost:3000) to access the application.

## TODO
- Refactore code to follow the coding style guides.

## Contributing
1. Fork it
2. Set it up
3. Create your feature branch (`git checkout -b your-initials-new-feature`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin your-initials-new-feature`)
6. Create a new Pull Request
