# encoding: utf-8

require File.join(File.dirname(__FILE__), "/../spec_helper")

describe BBC, "when used" do
  it "should version the application in a conventional manner" do
    BBC::VERSION.should =~ /\d+\.\d+\.\d+/
  end

  it "should describe the application" do
    BBC::NAME.should_not be_nil
  end

  it "has a user agent which includes the application version" do
    BBC::USER_AGENT.should =~ /\d+\.\d+\.\d+/
    BBC::USER_AGENT.should =~ /#{BBC::NAME}/
  end
end
