Feature: Web Search Engine
  As a curious user
  I want to search for information
  So that I can learn new things

  Scenario: Search for Pandas
    Given I open the DuckDuckGo homepage
    When I search for the phrase "Pandas"
    Then the search results title should contain "Pandas"