# encoding: utf-8

require File.join(File.dirname(__FILE__), "/../spec_helper")

describe NowNext, "when first created" do
  it "should be NowNext" do
    schedule = NowNext.new
    schedule.is_a?(NowNext).should == true
  end
end
