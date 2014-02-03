Feature: Location
  In order to get the weather for local people
  As a local person
  I want the weather for Royston Vasey

  Scenario: Finding the weather by place name
    When I enter the place name
    Then a list of potential matches is shown
