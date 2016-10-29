Feature: Sign up

  In order to use progress tracking features
  As a student
  I want to create an account with The Odin Project

  Background: Adding data to the database

    Given a course named 'Introduction to Web Development' exists
    And a section named 'About Web developers' exists
    And the following lessons exist in 'About Web developers' section:
    | lesson_name |
    | What a web developer does |
    | Tools of the trade |
    | Web Development Communities |
    | The Best Web Developers |

  Scenario: User creating an account through email
    Given I am on the homepage
    When I sign up with the email 'random@gmail.com'
    Then I should see 'Welcome! You have signed up successfully.'
    And 'random@gmail.com' receives an email with 'Getting started with The Odin Project' as the subject
    And I should see 'Confirm your email' in the email body
    When I follow 'Click here' in the email
    Then I should see 'Thanks for confirming your email address!'

  Scenario: User trying to create an account without filling in the fields
    Given I am on the homepage
    When I try to sign up without an email
    Then I should not able to sign up

  @omniauth_test
  Scenario: Signing up with Github
    Given I am on the sign up page
    And I click the sign up with Github Button
    And I verify my details
    When I click the sign up button
    Then my account should be created
    And I should be sent a confirmation email
    And I should be redirected to the courses page
