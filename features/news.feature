Feature: News
  In order to keep up to date with what's happening in the world
  As a geek
  I want news in my shell

  Scenario: News help
    When I get help for "news"
    Then the exit status should be 0
