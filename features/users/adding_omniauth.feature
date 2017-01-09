Feature: Adding omniauth to an existing account

  @omniauth_test
  Scenario: Add omniauth to an existing signed in user
    Given I am a user who already has an account
    When I click the link your github account button
    Then my Github account should be linked to my account
