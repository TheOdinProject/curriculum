Feature: Sign in

  In order to use the Odin Project effectively
  As a User
  I want to sign in to my account

  @omniauth_test
  Scenario: User Signs in with Github omniauth
    Given I have a omniauth account
    When I go to the sign in page
    And click the sign in with github button
    Then I should be logged in

  @omniauth_test
  Scenario: Unconfirmed omniauth user signs in within the 2 day grace period
    Given I have a unconfirmed omniauth account
    When I sign in
    Then I should see a message reminding me to confirm my email address
