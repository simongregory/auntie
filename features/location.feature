Feature: Location
  In order to get the weather for local people
  As a local
  I want the weather to know I'm from Royston Vasey

  Scenario: Finding the weather by place name
    When I enter the place name
    Then a list of potential matches is shown
