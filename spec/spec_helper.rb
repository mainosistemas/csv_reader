$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'csv_reader'
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start