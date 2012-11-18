Feature: TV
  In order to know what's on the box
  As a nerd
  I want to type `tv` and be enlightened

  Scenario: TV help
    When I get help for "tv"
    Then the exit status should be 0
