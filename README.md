# BinanceClient

This is a ruby api wrapper for [Binance API](https://binance-docs.github.io/apidocs/spot/en/#change-log)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'binance_client'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install binance_client

## Authenticate
```
client = BinanceClient.new(
    api_key: "your-api-key",
    api_secret: "your-api-secret"
)
```

## Requests
We provide one method per API endpoint.

### Current methods/endpoints

```
client.system_status
client.account_snapshot
client.get_all
client.book_ticker(symbol: "BTCETH")
```

## Responses
The default representation of response data is a JSON hash


## Development
Edit the `config.yml.sample` with your own credentials for testing

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/iamajvillalobos/binance_client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/iamajvillalobos/binance_client/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the BinanceClient project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/iamajvillalobos/binance_client/blob/master/CODE_OF_CONDUCT.md).
