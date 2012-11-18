# encoding: utf-8

require File.join(File.dirname(__FILE__), "/../spec_helper")

describe Schedule, "when first created" do
  it "should be Schedule" do
    schedule = Schedule.new
    schedule.is_a?(Schedule).should == true
  end
end
