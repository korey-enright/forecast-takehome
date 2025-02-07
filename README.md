# README

This is a very basic API consumer for weather data. With your chosen ruby version manager run `bundle install`, and add an API key to your Rails credentials file:
`rails credentials:edit`

It should look like this when saved:

```
open_weather:
    api_key: {your api key here}
geoapify:
    api_key: {your api key here}
```

Run `rails db:migrate` to generate the database, then `rails assets:precompile` to generate the appropriate tailwind CSS files, then the application should run using `rails s`.

The home page has a field for Address, this takes a string and converts it into a latitude and longitude using the first result from geoapify (it is biased for US results). This lat and long is fed into the OpenWeather API and saved to the database. If an existing forecast for that same address exists from the previous thirty minutes, it does not generate a new call to OpenWeather and simply serves you a cached result.



## Enhancements

* The UI obviously needs enhancements

* A user login system to perhaps save information for the user

* Requesting the user's location automatically

* A more robust address field, for instance one that autocompletes with information from Google

* A way to choose what information you get from the weather API

* Map, doppler radar, etc

* Hourly and minute based data

* Alerts

* Implement a proper cache using Redis for geodata, so as not to hit the geoapify API with the same info multiple times

* The VCR system to record API calls for tests, to allow for more robust testing and preservation of information between tests (also means no more hitting the APIs with each test)

* More robust tests in general, the controller successfully hits all the code necessary, but it's better to have unit tests for every individual file
