Feature: Sign out

  Scenario: User signs out
    Given I am logged in
    When I click the sign out link
    Then I should be signed out
