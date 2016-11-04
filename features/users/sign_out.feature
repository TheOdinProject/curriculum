Feature: Sign out

  Scenario: User signs out
    Given I am logged in
    When I click the sign out link
    Then I should be signed out

  Scenario: User is redirected to homepage
    Given I am logged in
    When I click the sign out link
    Then I should be redirected to the home page
