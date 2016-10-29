Feature: Sign in

  In order to use the Odin Project effectively
  As a User
  I want to sign in to my account

  @omniauth_test
  Scenario: User Signs in with Github omniauth
    Given I have a ominauth account
    When I go to the sign in page
    And click the sign in with github button
    Then I should be logged in
