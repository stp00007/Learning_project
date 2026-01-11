Feature: Orange SRM Login
  As a registered user
  I want to sign in
  So that I can access my dashboard

  Scenario: Login with valid credentials
    Given I open the Orange SRM homepage
    When I login with the configured credentials
    Then I should be logged in
