# Ipgeobase

[![build, lint, test](https://github.com/denis1011101/ipgeobase/actions/workflows/main.yml/badge.svg)](https://github.com/denis1011101/ipgeobase/actions/workflows/main.yml)

Welcome to my new study gem! This gem created for Hexlet Ruby course. It's a simple gem for getting geolocation data by IP address.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add ipgeobase

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install ipgeobase

## Usage

example usage:
ip_meta = Ipgeobase.lookup('8.8.8.8')
puts ip_meta.city
puts ip_meta.country
puts ip_meta.countryCode
puts ip_meta.lat
puts ip_meta.lon

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/denis1011101/ipgeobase/.
