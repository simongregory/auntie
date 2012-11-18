# encoding: utf-8

require File.join(File.dirname(__FILE__), "/../spec_helper")

describe Location, "when first created" do
  it "should be Location" do
    schedule = Location.new
    schedule.is_a?(Location).should == true
  end
end
