# encoding: utf-8

$:.push File.join(File.dirname(__FILE__), "..", "lib")
$:.push File.dirname(__FILE__)

require 'auntie'

require 'rspec'
require 'rspec/autorun'

def fixture(name)
  IO.read "spec/fixtures/#{name}"
end
