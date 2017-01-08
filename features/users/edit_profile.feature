Feature: Edit Profile

  Scenario: User can edit their profile
    Given I am logged in
    When I edit my profile
    Then my profile will be updated

  Scenario: User tries to edit another users account
    Given I am logged in
    When I go to the edit profile page of another user
    Then I will be denied access
