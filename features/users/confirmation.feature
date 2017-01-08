Feature: Confirming the users account

Background: Adding data to the database

  Given a course named 'Introduction to Web Development' exists
  And a section named 'About Web developers' exists
  And the following lessons exist in 'About Web developers' section:
  | lesson_name |
  | What a web developer does |
  | Tools of the trade |
  | Web Development Communities |
  | The Best Web Developers |

  Scenario: Unconfirmed user after 2 day grace period
    Given I have a unconfirmed account that is over 2 days old
    When I try to login
    Then a message will be displayed instructing me to confirm my email

  Scenario: Requesting confirmation instructions to be resent
    Given I have an account with the email 'kevin@example.com'
    When I request for confirmation instructions to be resent
    Then I should be resent a confirmation email
