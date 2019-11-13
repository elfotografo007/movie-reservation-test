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

Run the migrations:
```
sequel -m config/migrations/ $MV_DATABASE_URL
```

Start the development server:
```
puma
```

## Making requests

The default port is 9292. You can make requests hitting http://localhost:9292.
Use your favorite requests client (curl, Postman, etc) to play with the application. 

## Deployment

Set the following environment variables:
MV_ENV=production
MV_DATABASE_URL="postgres://user:password@host:port/database_name"

Don't forget to run the migrations:
```
heroku run sequel -m config/migrations/ $MV_DATABASE_URL
```