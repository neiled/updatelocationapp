Feature: Authenticate User
  In order to use the application
  As a user
  I want to authenticate my account with twitter
  
  Scenario: Welcome Page
    Given I'm not logged in
    When I go to the home page
    Then I should see "Connect to Twitter"
    