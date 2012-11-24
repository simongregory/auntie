# encoding: utf-8

require File.join(File.dirname(__FILE__), "/../spec_helper")

describe News, "when first created" do
  it "should be News" do
    forecast = News.new
    forecast.is_a?(News).should == true
  end
end
