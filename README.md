# Ruboty::Ume

An Ruboty Handler + Actions to output N line messages.

[![Build Status](https://travis-ci.org/tbpgr/ruboty-ume.png?branch=master)](https://travis-ci.org/tbpgr/ruboty-ume)
[![Coverage Status](https://coveralls.io/repos/tbpgr/ruboty-ume/badge.png)](https://coveralls.io/r/tbpgr/ruboty-ume)

[Ruboty](https://github.com/r7kamura/ruboty) is Chat bot framework. Ruby + Bot = Ruboty

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruboty-ume'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruboty-ume

## Usage
### Ume empty messages

~~~
> ruboty help
ruboty /ume (?<count>.*?)\z/               - output empty message N lines (<count> times)
> ruboty ume 3




> ruboty ume 5





~~~

### Umec specific text messages

~~~
> ruboty help
ruboty /umec (?<text>.+?) (?<count>.*?)\z/ - output <text> message N lines (<count> times)
> ruboty umec hoge 3
hoge
hoge
hoge

> ruboty umec hoge 5
hoge
hoge
hoge
hoge
hoge

~~~

## ENV
nothing

## Screenshot
nothing

## Dependency
nothing

## Reference
nothing

## Contributing

1. Fork it ( https://github.com/tbpgr/ruboty-ume/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
