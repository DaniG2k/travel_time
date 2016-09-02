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

### Gotchas

Although there is code in place to have the API request trigger via a Sidekiq job, this causes rendering issues in the show template.
For demonstration purposes, the default code will use the blocking version for the API request.

