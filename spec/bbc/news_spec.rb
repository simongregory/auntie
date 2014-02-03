# encoding: utf-8

require File.join(File.dirname(__FILE__), "/../spec_helper")

describe News do

  before(:each) do
    @io = StringIO.new
    @news = News.new(@io)
  end

  after(:each) do
    @news = nil
    @io = nil
  end

  it "shows the latest headlines" do
    @news.stub_chain(:open, :read) { fixture 'news.json' }
    @news.load

    expect( @io.string ).to start_with 'BBC News Headlines'
    expect( @io.string ).to include "Police say Moscow school gunman has been 'neutralised'"
    expect( @io.string ).to end_with "It puts the loss down to cheaper fares and weaker sterling.\n"
  end

  it "explains when it fails" do
    @news.stub_chain(:open, :read) { 'corrupt { json' }

    begin
      @news.load
    rescue SystemExit
    end

    #Unsure why this doesn't work with abort.
    #expect(@news.load).to raise_error(SystemExit, "Unable to download news")

    expect(@io.string).to end_with "Unable to download news\n"
  end

  it "truncates output to the size of the shell" do
    #
  end
end
