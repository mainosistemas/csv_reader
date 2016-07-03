# CsvReader

[![Code Climate](https://codeclimate.com/github/pedropazello/csv_reader/badges/gpa.svg)](https://codeclimate.com/github/pedropazello/csv_reader)
[![Test Coverage](https://codeclimate.com/github/pedropazello/csv_reader/badges/coverage.svg)](https://codeclimate.com/github/pedropazello/csv_reader/coverage)
[![Build Status](https://travis-ci.org/pedropazello/csv_reader.svg?branch=master)](https://travis-ci.org/pedropazello/csv_reader)

Parse CSV to hash structure.

Example:

| name | age | email         |
|------|-----|---------------|
| John | 23  | john@test.com |
| Lola | 25  | lola@test.com |

This CSV is transformed into:
[{name: 'John', age: '23', email: 'john@test.com}, {name: 'Lola', age: '25', email: 'lola@test.com'}]

Or, if your CSV have more than one table inside:

![Alt text](/spec/fixtures/files/multiple_table.png?raw=true "Table")

This CSV is transformed into:
{:People =>
  [{:name=>"John", :age=>"25", :email=>"john@test.com"},
   {:name=>"Jimmy", :age=>"30", :email=>"jimmy@test.com"},
   {:name=>"Lola", :age=>"23", :email=>"lola@test.com"}],
 :Music =>[{:name=>"Travel Is Dangerous", :band=>"Mogwai"}, {:name=>"Frozen Twilight", :band=>"God is An Astronaut"}]}


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'csv_reader', '0.2.0-beta', github: 'pedropazello/csv_reader'
```

And then execute:

    $ bundle


## Usage
#### `Reader` class
Converts a simple CSV to hash

```ruby
csv_file_content = File.new('/path/to/your/csv/table.csv').read
=> "name\tage\temail\nJohn\t25\tjohn@test.com\nJimmy\t30\tjimmy@test.com\nLola\t23\tlola@test.com\n"

CsvReader::Reader.new(csv_file_content).csv_parsed
=> [{:name=>"John", :age=>"25", :email=>"john@test.com"},
 {:name=>"Jimmy", :age=>"30", :email=>"jimmy@test.com"},
 {:name=>"Lola", :age=>"23", :email=>"lola@test.com"}]
```
### `MultipleTableReader` class
Converts a CSV with more then one table to hash, where each key represents a table

```ruby
csv_file_content = File.new('/path/to/your/csv/table.csv').read
=> "People\t\t\nname\tage\temail\nJohn\t25\tjohn@test.com\nJimmy\t30\tjimmy@test.com\nLola\t23\tlola@test.com\n\t\t\nMusic\t\t\nname\tband\t\nTravel Is Dangerous\tMogwai\t\nFrozen Twilight\tGod is An Astronaut\t\n"

CsvReader::MultipleTableReader.new(csv_file_content, ['People', 'Music']).csv_parsed
=> {:People=>
  [{:name=>"John", :age=>"25", :email=>"john@test.com"},
   {:name=>"Jimmy", :age=>"30", :email=>"jimmy@test.com"},
   {:name=>"Lola", :age=>"23", :email=>"lola@test.com"}],
 :Music=>[{:name=>"Travel Is Dangerous", :band=>"Mogwai"}, {:name=>"Frozen Twilight", :band=>"God is An Astronaut"}]}

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
