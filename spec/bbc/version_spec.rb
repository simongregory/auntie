# encoding: utf-8

require File.join(File.dirname(__FILE__), "/../spec_helper")

describe AUNTIE, "when asked" do
  it "provides a human readable name for the application" do
    AUNTIE::NAME.should_not be_nil
  end

  it "shows the semantic version of the application" do
    AUNTIE::VERSION.should =~ /\d+\.\d+\.\d+/
  end

  it "has a user agent which includes the application name and version" do
    AUNTIE::USER_AGENT.should =~ /\d+\.\d+\.\d+/
    AUNTIE::USER_AGENT.should =~ /#{AUNTIE::NAME}/
  end
end
