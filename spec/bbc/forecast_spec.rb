# encoding: utf-8

require File.join(File.dirname(__FILE__), "/../spec_helper")

describe Forecast, "when first created" do
  it "should be Forecast" do
    forecast = Forecast.new
    forecast.is_a?(Forecast).should == true
  end
end
