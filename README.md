# CsvReader

[![Code Climate](https://codeclimate.com/github/pedropazello/csv_reader/badges/gpa.svg)](https://codeclimate.com/github/pedropazello/csv_reader)
[![Test Coverage](https://codeclimate.com/github/pedropazello/csv_reader/badges/coverage.svg)](https://codeclimate.com/github/pedropazello/csv_reader/coverage)
[![Build Status](https://travis-ci.org/pedropazello/csv_reader.svg?branch=master)](https://travis-ci.org/pedropazello/csv_reader)

Read a CSV file and transform it into a array of hashes, where the key is the name of column in symbol and the value
is the content of the rows.

Example:

| name | age | email         |
|------|-----|---------------|
| John | 23  | john@test.com |
| Lola | 25  | lola@test.com |

This CSV is transformed into:
[{name: 'John', age: '23', email: 'john@test.com}, {name: 'Lola', age: '25', email: 'lola@test.com'}]

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'csv_reader', github: 'pedropazello/csv_reader'
```

And then execute:

    $ bundle


## Usage
```ruby
csv_file = File.new('/path/to/your/csv/table.csv').read
=> "name\tage\temail\nJohn\t25\tjohn@test.com\nJimmy\t30\tjimmy@test.com\nLola\t23\tlola@test.com\n"

CsvReader::Reader.read(csv_file).array_prepared
=> [{:name=>"John", :age=>"25", :email=>"john@test.com"},
 {:name=>"Jimmy", :age=>"30", :email=>"jimmy@test.com"},
 {:name=>"Lola", :age=>"23", :email=>"lola@test.com"}]
```
## IMPORTANT
It only works with tabs as field delimiters

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pedropazello/csv_reader.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

