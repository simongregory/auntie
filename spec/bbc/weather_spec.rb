# encoding: utf-8

require File.join(File.dirname(__FILE__), "/../spec_helper")

describe Weather do
  before(:each) do
    @io = StringIO.new
    @weather = Weather.new('w3', @io)
  end

  after(:each) do
    @weather = nil
    @io = nil
  end

  it "shows the hourly forecast" do
    @weather.stub_chain(:open, :read) { fixture '3hourlyforecast.json' }
    @weather.hourly

    expect( @io.string ).to start_with "\nThe next 24 hours in SE1"
  end

  it "shows the daily forecast" do
    @weather.stub_chain(:open, :read) { fixture '3dayforecast.json' }
    @weather.daily

    expect( @io.string ).to start_with "\nThe next 3 days in London"
  end

  it "explains when it fails" do
    @weather.stub_chain(:open, :read) { 'corrupt } json {' }

    begin
      @weather.hourly
    rescue SystemExit
    end

    expect(@io.string).to end_with "Unable to download the weather\n"
  end

end
