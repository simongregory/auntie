# encoding: utf-8

require File.join(File.dirname(__FILE__), "/../spec_helper")

describe Location, "when first created" do
  before(:each) do
    @io = StringIO.new
    @location = Location.new(@io)
  end

  it "lists location matches for a term" do
    @location.stub_chain(:open, :read) { fixture 'location.json' }

    @location.find 'royston'

    expect( @io.string ).to include('Barnsley')
    expect( @io.string ).to include('2639017')

    expect( @io.string ).to include('Hertfordshire')
    expect( @io.string ).to include('2639018')
  end

  it "warns when a term is too small" do
    lambda {
      @location.find 'ky'
    }.should raise_error(SystemExit)

    #TODO: Check it emits "Please use a longer search term"
  end

  it "explains when no results are found" do
  end

  it "explains when it fails" do
    @location.stub_chain(:open, :read) { 'corrupt { json' }

    begin
      @location.find 'Royston Vasey'
    rescue SystemExit
    end

    expect(@io.string).to end_with "Unable to download location data\n"
  end
end

