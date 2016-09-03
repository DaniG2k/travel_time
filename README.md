# Time Travel

A tiny Rails app that shows travel times using Citymapper's API.

### Setup

Clone it:
```sh
git clone https://github.com/DaniG2k/travel_time.git
cd travel_time
```
Run the bundle command:
```sh
bundle install
```
Remember to add a secrets.yml file. You will also need a CityMapper API key.
```yml
development:
  citymapper_key: myfantastickey
```
Setup the db:
```sh
rails db:create
rails db:migrate
```
Start the server:
```sh
rails server
```
Voila!

You can now add an address into the start and end fields, set a departure time and the travel time will be culated via the CityMapper API!

### Tests

Run model tests with:

```sh
bundle exec rspec spec/models
```

And run feature tests with:
```sh
bundle exec rspec spec/features/
```
Please note that feature specs will actually trigger API calls to CityMapper so don't overuse.

### Gotchas

1. Although there is code in place to have the API request trigger via a Sidekiq job, this causes rendering issues in the show template. For demonstration purposes, the default code will use the blocking version for the API request.
2. I wanted Location to belongs_to Routes and Routes to have_many Locations. However, this was not possible due to the order in which objects need to be committed to the database. Routes would require coordinates, and Locations woud require a Route object to exist. This is a flaw which I was not able to correct due to the following reason:
3. I tried only using Route objects and remove Location objects altogether. However, the Geocoder gem only allows one set of latitude/longitude attributes, and whichever you specify last will be used. I could not have a start_lon, start_lat and a end_lon, end_lat for this reason.