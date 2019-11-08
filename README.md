# Movie Reservation test

This project is a movie reservation API web application.

## Requirements
- Ruby 2.6.3
- Postgres 11


## Setup
To get started, clone the project and enter the directory:
```
git clone git@github.com:elfotografo007/movie-reservation-test.git
cd movie-reservation-test
```

Install dependencies:
```
bundle install
```

Then create a database in Postgres and set a environment variable with the 
connection string:
```
export MV_DATABASE_URL="postgres://user:password@host:port/database_name"
```

# TODO add how to run migrations

## Deployment

Set the following environment variables:
MV_ENV=production
MV_DATABASE_URL="postgres://user:password@host:port/database_name"