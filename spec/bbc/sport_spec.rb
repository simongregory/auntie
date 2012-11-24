# encoding: utf-8

require File.join(File.dirname(__FILE__), "/../spec_helper")

describe Sport, "when first created" do
  it "should be Sport" do
    forecast = Sport.new
    forecast.is_a?(Sport).should == true
  end
end
