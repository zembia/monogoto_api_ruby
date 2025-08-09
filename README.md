# Monogoto API Ruby Client

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE.txt)

A simple and unofficial Ruby wrapper for the [Monogoto](https://www.monogoto.io/) IoT Connectivity API.

> ⚠️ This gem is not affiliated with Monogoto. Use it at your own risk.

---

## 1. Installation

Add this line to your application's Gemfile:

```ruby
gem "monogoto_api"
```

And then execute:

```bash
bundle install
```

Or install it manually with:

```bash
gem install monogoto_api
```

---

## 2. Usage

### 1. Configure the client

You can authenticate with your Monogoto credentials:

```ruby
require "monogoto_api"

client = MonogotoApi::Client.new("monogoto_user", "monogoto_pass")

```
You can retive account information

```
things_list = client.things
```

or you can operate by Things with the ICCID

```
thing = client.thing(iccid)

pings = client.thing_ping(iccid)

result = clientg.thing_state(iccid)

result = client.thing_session_status(iccid)

result = client.thing_refresh_connection(iccid)

events = client.thing_events(iccid)
```


## Contributing

Bug reports and pull requests are welcome! Please open an issue first to discuss changes.

To contribute:

1. Fork the repo
2. Create a new branch
3. Commit your changes
4. Submit a Pull Request

### Enviroment variables to develop

You have to set this ENV vars in the file `.env` in the root directory

    MONOGOTO_USER="<email>"
    MONOGOTO_PASS="<PASSWORD>"
    MONOGOTO_ICCID_SAMPLE="<ICCID>"
---

## License

This project is licensed under the [MIT License](LICENSE.txt).