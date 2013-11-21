PasswordListGenerator
=====================

[![Gem Version][GV img]][Gem Version]
[![Build Status][BS img]][Build Status]
[![Dependency Status][DS img]][Dependency Status]
[![Code Climate][CC img]][Code Climate]
[![Coverage Status][CS img]][Coverage Status]

## Description

Generate a list of passwords from the command line. The complexity of the password can be passed in through the CLI.

## Installation

PasswordListGenerator is cryptographically signed. To be sure the gem you install hasn't been tampered with:

Add my public key (if you haven't already) as a trusted certificate gem

> gem cert --add <(curl -Ls https://raw.github.com/stephaneliu/password_generator/master/certs/stephaneliu.pem)
 
> gem install password_list_generator -P HighSecurity.

Warning: This may cause installation to fail if non-signed depenedent gems are also being installed.

## Usage

Defaults:
> pwgen

See more options:
> pwgen -h

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-awesomie-feature`)
3. Commit your changes (`git commit -am 'My some awesome feature'`)
4. Push to branch (`git push origin my-awesome-feature`)
5. Create a new Pull Request

[Gem Version]: https://rubygems.org/gems/password_list_generator
[Build Status]: https://travis-ci.org/stephaneliu/password_generator
[travis pull requests]: https://travis-ci.org/stephaneliu/password_generator/pull_requests
[Dependency Status]: https://gemnasium.com/stephaneliu/password_generator
[Code Climate]: https://codeclimate.com/github/stephaneliu/password_generator
[Coverage Status]: https://coveralls.io/r/stephaneliu/password_generator

[GV img]: https://badge.fury.io/rb/password_list_generator.png
[BS img]: https://travis-ci.org/stephaneliu/password_generator.png
[DS img]: https://gemnasium.com/stephaneliu/password_generator.png
[CC img]: https://codeclimate.com/github/stephaneliu/password_generator.png
[CS img]: https://coveralls.io/repos/stephaneliu/password_generator/badge.png?branch=master


