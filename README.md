# MessageBird REST API library for Dart
This repository contains an unofficial Dart client for MessageBird's REST API. Documentation can be found at: https://developers.messagebird.com.

## Requirements
- [Sign up](https://www.messagebird.com/en/signup) for a free MessageBird account
- Create a new `access_key` in the [developers](https://www.messagebird.com/app/en/settings/developers/access) section

## Installation
Add the following code to your `pubspec.yaml` file:

```yaml
dependencies:
  messagebird-dart:
    git:
      url: https://git.dev.drillster.com/drillster/messagebird-dart.git
      version: ^1.0.0
```

## Usage
First initialize the library in your code. Then, an API from the `messagebird` package can be accessed by initializing a service with your API key.

## Example
See `example/example.dart`

```dart
import 'package:messagebird/balance.dart'

void main() {
  final BalanceService balanceService = ApiBalanceService('YOUR_KEY_HERE');
  balanceService.read().then((balance) => print('My balance is ${balance.amount}'));
}
```

## Conversations Whatsapp Sandbox
To use the whatsapp sandbox you need to add `"ENABLE_CONVERSATIONSAPI_WHATSAPP_SANDBOX"` to the list of features you want enabled (named parameter `features` in the constructor of any service).

## Tests
This repository includes unit tests, located in the `test` directory. To run them, execute `pub run test` in the command line. Covered are, per service, service tests and json (de)serialization tests of data classes.

Before running the tests, create a `keys.json` file in `test_resources/` with the following content:
```json
{
    "test": "YOUR_API_TEST_KEY",
    "live": "YOUR_API_LIVE_KEY",
    "msisdn": /* The MSISDN you want to test with (as an integer) */
}
```

## License
The MessageBird REST API for Dart is licensed under [The BSD 2-Clause License](http://opensource.org/licenses/BSD-2-Clause). Copyright (c) 2019, Drillster B.V. 
The MessageBird platform and MessageBird trademark are property of MessageBird B.V.