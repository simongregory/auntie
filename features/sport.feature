Feature: Sport
  In order to see who's winning the Rugby
  As a nerd
  I want a quick list of sport headlines

  Scenario: Sport help
    When I get help for "sport"
    Then the exit status should be 0
