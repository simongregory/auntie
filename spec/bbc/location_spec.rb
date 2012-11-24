# encoding: utf-8

require File.join(File.dirname(__FILE__), "/../spec_helper")

describe Location, "when first created" do
  it "should be Location" do
    location = Location.new
    location.is_a?(String).should == true
  end

  it "lists location matches for a term" do
  end

  it "warns when a term is too small" do
  end

  it "explains when no results are found" do
  end

end

