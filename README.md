# KnoxRestaurants

This Ruby gem parses Yelp API to gather information about restaurants in Knoxville, Tennessee. It uses user input to prompt different displays of information for restaurants based on a numbered item list of cuisines. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'Knox_Restaurants'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install Knox_Restaurants

## Usage

Before starting the program, you would need to acquire Yelp's API key. Go to https://www.yelp.com/developers/v3/manage_app to create an account or use your existing Yelp login information to create an app. The information about the app isn't important because we just need an API key to access the API for this gem. 

Once you created an app, you should see your API key. Go back to your terminal and inside the Knox_Restaurants directory, type 'touch .env'. This creates an environment file that will story your personal API key. Go to the '.env' file and type in 'export API_KEY=<your API Key>. Once that's done, you should be able to start your program.

To start the program, run 'bin/Knox_Restaurants' in terminal. There will be a numbered list of cuisines to choose from. There will be a prompt to enter in a number. It will return a list of restaurants corresponding to the user's input. From here, enter a valid number to get more information for that restaurant. Enter "end" to exit the program.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/chayadeaver/Knox_Restaurants. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the KnoxRestaurants project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/Knox_Restaurants/blob/master/CODE_OF_CONDUCT.md).
