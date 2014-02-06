# encoding: utf-8

require File.join(File.dirname(__FILE__), '/../spec_helper')

describe Timings do
  describe 'what the time is now' do
    it 'is now' do
      expect(Timings.time_now.class).to be Time
    end
  end

  describe 'how long until a programme starts' do
    it 'is on now' do
      expect(Timings.how_long_between(1, 0)).to eq 'On now'
    end

    it 'is now' do
      expect(Timings.how_long_between(0, 0)).to eq 'Now!'
    end

    it 'is in a second' do
      expect(Timings.how_long_between(0, 1)).to eq 'A second'
    end

    it 'in seconds' do
      expect(Timings.how_long_between(0, 2)).to eq '2 secs'
      expect(Timings.how_long_between(0, 59)).to eq '59 secs'
    end

    it 'is a minute' do
      expect(Timings.how_long_between(0, 60)).to eq 'A min'
      expect(Timings.how_long_between(0, 119)).to eq 'A min' # round here?
    end

    it 'is minutes' do
      expect(Timings.how_long_between(0, 120)).to eq '2 mins'
      expect(Timings.how_long_between(0, 3_540)).to eq '59 mins'
    end

    it 'is an hour' do
      expect(Timings.how_long_between(0, 3_541)).to eq 'An hour'
      expect(Timings.how_long_between(0, 7_100)).to eq 'An hour' # round here?
    end

    it 'is hours' do
      expect(Timings.how_long_between(0, 7_101)).to eq '2 hours'
      expect(Timings.how_long_between(0, 82_800)).to eq '23 hours'
    end

    it 'is a day' do
      expect(Timings.how_long_between(0, 82_801)).to eq 'A day'
      expect(Timings.how_long_between(0, 172_000)).to eq 'A day'
    end

    it 'is days' do
      expect(Timings.how_long_between(0, 172_001)).to eq '2 days'
      expect(Timings.how_long_between(0, 518_400)).to eq '6 days'
    end

    it 'is a week' do
      expect(Timings.how_long_between(0, 518_401)).to eq 'A week'
      expect(Timings.how_long_between(0, 1_036_800)).to eq 'A week'
    end

    it 'is weeks' do
      expect(Timings.how_long_between(0, 1_036_801)).to eq '2 weeks'
    end
  end
end
