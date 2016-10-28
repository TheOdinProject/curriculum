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

  @omniauth_test
  Scenario: Signing up with Github
    Given I am on the sign up page
    And I click the sign up with Github Button
    And I verify my details
    When I click the sign up button
    Then my account should be created
    And I should be sent a confirmation email
    And I should be redirected to the courses page
