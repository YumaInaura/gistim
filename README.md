# Gistim

## Installation

```
$ gem install gistim
```

## Ready

```
gist --login
```

( Not `gistim --login` )

And enable access to github by git protocol.

## Usage

We can clone both specify hash or URL.

```
gistim clone 32b6d6ba379d4a65d22c06e3f8d284c0
```

```
gistim clone https://gist.github.com/YumaInaura/32b6d6ba379d4a65d22c06e3f8d284c0
```

Even if you specify https URL gistim clone by git protocol. Because we can push to Gist repository by git protocol.

We can specifiy directory name.

```
gistim clone https://gist.github.com/YumaInaura/32b6d6ba379d4a65d22c06e3f8d284c0 mac_replace_clipboard
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/YumaInaura/gistim. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Gistim project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/YumaInaura/gistim/blob/master/CODE_OF_CONDUCT.md).
