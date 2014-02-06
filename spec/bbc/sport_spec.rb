# encoding: utf-8

require File.join(File.dirname(__FILE__), '/../spec_helper')

describe Sport do
  before(:each) do
    @io = StringIO.new
    @sport = Sport.new(@io)
  end

  after(:each) do
    @sport = nil
    @io = nil
  end

  it 'shows the latest headlines' do
    @sport.stub_chain(:open, :read) { fixture 'sport.json' }
    @sport.headlines

    expect(@io.string).to include 'Winter olympics'
    expect(@io.string).to include 'Leeds boss'
    expect(@io.string).to include 'American football'
  end

  it 'explains when it fails' do
    @sport.stub_chain(:open, :read) { 'corrupt { json' }

    expect { @sport.headlines }.to raise_error 'Unable to download sport data'
  end
end
