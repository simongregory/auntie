# encoding: utf-8

# require 'coveralls'
# Coveralls.wear!

require 'simplecov'
SimpleCov.start

$:.push File.join(File.dirname(__FILE__), "..", "lib")
$:.push File.dirname(__FILE__)

require 'auntie'

require 'rspec'
require 'rspec/autorun'

def fixture(name)
  IO.read "spec/fixtures/#{name}"
end
