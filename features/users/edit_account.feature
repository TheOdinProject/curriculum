Feature: Edit account

  Scenario: user can edit their account
    Given I am logged in
    When I edit my account
    Then my updated details should be saved

  @omniauth_test
  Scenario: Omniauth user can edit their account
    Given I am logged in with a omniauth account
    When I edit my account without a password
    Then my updated details should be saved
