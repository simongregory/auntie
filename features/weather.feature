Feature: Weather
  To find out what the heavens might have instore
  As a nerd
  I want the weather in my shell

  Scenario: Weather help
    When I get help for "weather"
    Then the exit status should be 0
