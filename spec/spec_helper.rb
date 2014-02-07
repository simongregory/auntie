# encoding: utf-8

$LOAD_PATH.push File.join(File.dirname(__FILE__), '..', 'lib')
$LOAD_PATH.push File.dirname(__FILE__)

require 'coveralls'
Coveralls.wear!

# require 'simplecov'
# SimpleCov.start

require 'auntie'

require 'rspec'
require 'rspec/autorun'

def fixture(name)
  IO.read "spec/fixtures/#{name}"
end
