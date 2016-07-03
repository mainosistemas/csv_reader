require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'csv_reader/reader'
require 'csv_reader/multiple_table_reader'

def read_file_from_fixtures(file_name)
  File.new(File.open("spec/fixtures/files/#{file_name}")).read
end
