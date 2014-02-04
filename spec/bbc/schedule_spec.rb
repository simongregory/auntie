# encoding: utf-8

require File.join(File.dirname(__FILE__), "/../spec_helper")

describe Schedule do

  before(:each) do
    @io = StringIO.new
    @schedule = Schedule.new @io
    @schedule.stub(:time_now).and_return(Time.at 1391435797) #13:56:37
  end

  after(:each) do
    @io = nil
    @schedule = nil
  end

  it "lists todays schedule for BBC One" do
    @schedule.stub_chain(:open, :read) { fixture 'schedule_tv.json' }

    channel = { :id => "bbcone" }
    @schedule.load channel

    expect(@io.string).to include '13:45 Doctors'
    expect(@io.string).to include '23:40 The Graham Norton Show'
    expect(@io.string).to include '00:30 Joins BBC News'
  end

  it "what is on now is the first in the list" do
    @schedule.stub_chain(:open, :read) { fixture 'schedule_tv.json' }

    channel = { :id => "bbcone" }
    @schedule.load channel

    expect(@io.string).to start_with "\e[92m13:45 Doctors"
  end

  it "lists todays schedule for Radio Six Musix" do
    @schedule.stub_chain(:open, :read) { fixture 'schedule_radio_today.json' }

    station = { :id => "6music" }
    @schedule.load station

    expect(@io.string).to include '13:00 Radcliffe and Maconie'
    expect(@io.string).to include '05:00 Chris Hawkins'
  end

  it "lists yesterday's schedule for Radio Six Music" do
    @schedule.stub_chain(:open, :read) { fixture 'schedule_radio_yesterday.json' }

    station = { :id => "6music", :period => "/yesterday"  }
    @schedule.load station

    expect(@io.string).to include '20:00 Stuart Maconie\'s Freak Zone'
  end

  it "lists tomorrow's schedule for Radio Six Music" do
    @schedule.stub_chain(:open, :read) { fixture 'schedule_radio_tomorrow.json' }

    station = { :id => "6music" }
    @schedule.load station

    expect(@io.string).to include '13:00 Radcliffe and Maconie'
  end
end
