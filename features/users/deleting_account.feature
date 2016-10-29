Feature: Deleting user account

  Scenario: User cancels their account
    Given I am logged in
    When I click the cancel my account link
    Then my account should be deleted
