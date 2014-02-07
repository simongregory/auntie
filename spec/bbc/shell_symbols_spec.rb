# encoding: utf-8

require File.join(File.dirname(__FILE__), '/../spec_helper')

describe ShellCharacters, "character conversion to symbols escaped for terminal output" do
  it 'converts cardinal compass points to symbols' do
    points =  %w(N NE E SE S SW W NW)
    symbols = %w(↑ ↗ → ↘ ↓ ↙ ← ↖)

    points.zip(symbols).each do |p, s|
      expect(ShellCharacters.symbol_for_compass(p)).to eq(s)
    end
  end

  it 'converts ordinal compass points to symbols' do
    points =  %w(NE SE  SW  NW)
    symbols = %w(↗  ↘  ↙  ↖)

    points.zip(symbols).each do |p, s|
      expect(ShellCharacters.symbol_for_compass(p)).to eq(s)
    end
  end

  it 'rounds secondary intercardinal points to the closest cardinal' do
    points =  %w(NNE ENE ESE SSE SSW WSW WNW NNW)
    symbols = %w( ↑   →   →   ↓   ↓   ←   ←   ↑)

    points.zip(symbols).each do |p, s|
      expect(ShellCharacters.symbol_for_compass(p)).to eq(s)
    end

  end

  it 'defaults to north when a compass point description is not recognised' do
    expect(ShellCharacters.symbol_for_compass('')).to eq('↑')
  end

  it 'has degrees centigrade' do
    expect(ShellCharacters.degrees_c).to eq('°C')
  end

  it 'has degrees farenheit' do
    expect(ShellCharacters.degrees_f).to eq('°F')
  end

  it 'draws blocks' do
    expect(ShellCharacters.square_block).to eq('█')
  end
end
