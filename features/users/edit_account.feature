Feature: Edit account

  @omniauth_test
  Scenario: Omniauth user can edit thier account
    Given I am logged in with a omniauth account
    When I edit my account
    Then my updated details should be saved
