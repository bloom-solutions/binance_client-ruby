# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Added
- `#sub_account_bnb_burn_status`
- `#sub_account_set_spot_bnb_burn`
- `#sub_account_transfer`
- `#sub_account_create_api_keys`
- `#create_test_order`

### Changed
- `Deposit#sub_account_id` is an Integer and no longer a String. Consistent with sub_account_id everywhere else

## [4.0.0]
### Added
- Add optional `network` parameter when getting deposit address of a specific network
- Use keyword arguments when calling `sub_account_deposit_address`

## [3.0.1]
### Fixed
- `Coin#network_list` is initialized properly
- Return decimal for the following methods of `Network`:
  - `#withdraw_fee`
  - `#withdraw_integer_multiple`
  - `#withdraw_max`
  - `#withdraw_min`

## [3.0.0]
### Changed
- Rename `#get_all` to `#coins_info` and give access to info via the response's `#coins` method

### Fixed
- `Deposit#insert_time` returns `Time` and not an Integer of milliseconds

### Added
- Add Deposit, RateLimit factories

## [2.1.0]
### Added
- `exchange_info` endpoint
- `sub_account_deposit_history` endpoint

## [2.0.0]
### Changed
- Remove `used_weight` from responses

### Added
- `recv_window` configuration to set `recvWindow`
- `#account` call to get the `/api/v3/account` info

### Added
- `used_weights` to responses

## [1.4.0] - 2021-12-09
### Added
- Add factories for use in app development
- Add `#sub_account_deposit_address`

## [1.3.0] - 2021-11-29
### Added
- Add proxy support

## [1.2.0] - 2021-11-26
### Added
- Allow easy access to the `used_weight` header in a response by calling `#used_weight(interval)`
- `#sub_account_assets` to get the assets of a sub-account
- `#body_code` to return the value of "code" in the body, if it exists
- `#message` to return the value of "message" in the body, if it exists

## [1.1.0]
### Added
- `order_book_depth` (`/api/v3/depth`) to get a snapshot of the order book

## [1.0.0]
### Fixed
- Avoid "Signature for this request is not valid" errors by using the same timestamp
- Remove pry as a development dependency

## [0.2.0] - 2020-09-14
### Added

- [enable vcr for other tests](/../../commit/aaf2fbb))
- [add book_ticker endpoint](/../../commit/bc7c896))
- [added get_all endpoint](/../../commit/b22fa3f))
- [add account_snapshot endpoint](/../../commit/e64826a))
- [add system_status endpoint](/../../commit/fbc3c36))

### Fixed
- [ignore non deterministic part of the url](/../../commit/647a822))
