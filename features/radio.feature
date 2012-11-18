Feature: Radio
  In order to know what's on the wireless
  As a nerd
  I want to type `radio` and see what could be coming in my ears

  Scenario: Radio help
    When I get help for "radio"
    Then the exit status should be 0
