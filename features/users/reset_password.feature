Feature: Reset password
  As a User who has forgotten their password
  When I request to change my password
  Then my password should be changed

Background: Adding data to the database

  Given a course named 'Introduction to Web Development' exists
  And a section named 'About Web developers' exists
  And the following lessons exist in 'About Web developers' section:
  | lesson_name |
  | What a web developer does |
  | Tools of the trade |
  | Web Development Communities |
  | The Best Web Developers |

Scenario: User requesting to reset his/her password - happy path

  Given I have an account with the email 'kevin@example.com'
  When I request to reset my password
  Then I should get an email to reset the password
  When I click on the reset password link
  And I fill in the new password
  Then my password should be changed

Scenario: User requesting to reset his/her password - sad path

  Given I have an account with the email 'kevin@example.com'
  When I request to reset my password
  Then I should get an email to reset the password
  When I click on the reset password link
  And I fill in non-matching passwords
  Then I should get an error
