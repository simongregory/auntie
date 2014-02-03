# encoding: utf-8

require File.join(File.dirname(__FILE__), "/../spec_helper")

describe NowNext do
  before(:each) do
    @io = StringIO.new
    @nn = NowNext.new @io

    @nn.stub(:time_now) { Time.at(1391430000) }
  end

  after(:each) do
    @io = nil
    @nn = nil
  end

  it "shows what's on tv now" do
    #TODO: Mock Time
    @nn.stub_chain(:open, :read) { fixture 'now_next_tv.json' }
    @nn.tv_now

    expect(@io.string).to include 'Saints and Scroungers'
    expect(@io.string).to include 'Arthur'
    expect(@io.string).to include 'Seo Alba (This is Alba)'
  end

  it "shows what's on tv next" do
    @nn.stub_chain(:open, :read) { fixture 'now_next_tv.json' }

    @nn.tv_next

    expect(@io.string).to match(/On now\s+One\s+Bargain Hunt/)
    expect(@io.string).to match(/6 hours\s+Three\s+Great Movie Mistakes/)
  end

  it "shows what's on radio now" do
    @nn.stub_chain(:open, :read) { fixture 'now_next_radio.json' }

    @nn.radio_now

    expect(@io.string).to include "Fearne Cotton"
  end

  it "shows what's on radio next" do
    @nn.stub_chain(:open, :read) { fixture 'now_next_radio.json' }

    @nn.radio_next

    expect(@io.string).to match(/40 mins\s+Radio 6 Music\s+Radcliffe and Maconie/)
    expect(@io.string).to match(/5 hours\s+Radio 5 live sports extra\s+Coming up on 5 live sports extra/)
  end
end
