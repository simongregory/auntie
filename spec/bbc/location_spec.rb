# encoding: utf-8

require File.join(File.dirname(__FILE__), '/../spec_helper')

describe Location, 'when first created' do
  before(:each) do
    @io = StringIO.new
    @location = Location.new(@io)
  end

  after(:each) do
    @location = nil
    @io = nil
  end

  it 'lists location matches for a term' do
    @location.stub_chain(:open, :read) { fixture 'location.json' }

    @location.find 'royston'

    expect(@io.string).to include('Barnsley')
    expect(@io.string).to include('2639017')

    expect(@io.string).to include('Hertfordshire')
    expect(@io.string).to include('2639018')
  end

  it 'warns when a term is too small' do
    expect { @location.find 'ky' }.to raise_error('Please use a longer search term')
  end

  it 'explains when no results are found' do
    @location.stub_chain(:open, :read) { '{}' }

    @location.find 'Royston Vasey'

    expect(@io.string).to include("No locations found matching 'Royston Vasey'")
  end

  it 'explains when it fails' do
    @location.stub_chain(:open, :read) { 'corrupt { json' }

    expect { @location.find 'Royston Vasey' }.to raise_error('Unable to download location data')
  end
end
