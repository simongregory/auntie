# encoding: utf-8

require File.join(File.dirname(__FILE__), "/../spec_helper")

describe ShellCharacters do
  it "converts compass points to symbols that can be printed in the shell" do
    points =  ['N', 'NNE', 'NE', 'ENE', 'E', 'ESE', 'SE', 'SSE', 'S', 'SSW', 'SW', 'WSW', 'W', 'WNW', 'NW', 'NNW']
    symbols = ['↑', '↑',   '↗', '→',   '→',  '→',   '↘', '↓',   '↓', '↓',   '↙', '←',   '←', '←',   '↖', '↑']

    points.zip(symbols).each do |p,s|
      expect(ShellCharacters.symbol_for_compass(p)).to eq(s)
    end
  end

  it "defaults to north when a compass point description is not recognised" do
    expect(ShellCharacters.symbol_for_compass('')).to eq('↑')
  end

  it "has degrees centigrade" do
    expect(ShellCharacters.degrees_c).to eq('°C')
  end

  it "has degrees farenheit" do
    expect(ShellCharacters.degrees_f).to eq('°F')
  end

  it "draws blocks" do
    expect(ShellCharacters.square_block).to eq('█')
  end
end