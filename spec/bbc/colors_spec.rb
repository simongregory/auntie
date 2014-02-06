# encoding: utf-8

require File.join(File.dirname(__FILE__), "/../spec_helper")

describe ShellColors, "colours text for terminal" do
  it "colours red" do
    expect(ShellColors.red "red").to eq "\e[31mred\e[0m"
  end

  it "colours green, yellow, cyan, blue, light green" do
    colours = ["red", "green", "yellow", "blue", "cyan", "white"]
    codes   = [31,    32,       33,       34,    36,      37]

    colours.zip(codes) do |color,code|
      expect(ShellColors.send(color, color)).to include("\e[#{code}m#{color}")
    end
  end
end