Feature: Edit Profile

  Scenario: User tries to edit another users account
  Given I am logged in
  When I go to the edit profile page of another user
  Then I will be denied access
