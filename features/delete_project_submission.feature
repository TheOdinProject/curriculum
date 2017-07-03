Feature: Delete a project submission
  As an odinite
  I want to be able to delete my project submission

Background: Adding data to the database
  Given a course named 'Web Development 101' exists
  And a section named 'The Front End' exists
  And the following lessons exist in 'The Front End' section:
  | title    | is_project |
  | HTML/CSS | true       |
  And the following users exist:
  | username | password |
  | kevin    | foobar   |
  | dana     | secret   |
  | john     | hunter  |
  And the following project submissions exist:
  | repo_url                          | live_preview               | lesson   | username |
  | https://github.com/test/repo      | https://codepen.io/test    | HTML/CSS | kevin |
  | https://github.com/user/repo_name | https://codepen.io/project | HTML/CSS | dana |

  Scenario: Trying to delete a project submission before logging in
    Given I am on the 'Web Development 101' course page
    When I go to the 'HTML/CSS' lesson page
    Then I should see "Recent submissions"
    And I should see "Kevin's solution"
    And I should not see "There are no submissions for this project yet. Be the first!"
    And I should not see the delete project submission button

  @javascript
  Scenario: Trying to edit a project submission after logging in - happy path
    Given I am logged in as 'kevin' with password 'foobar'
    And I am on the 'Web Development 101' course page
    And I go to the 'HTML/CSS' lesson page
    When I click on the delete project submission button
    Then I should see "Are you sure you want to delete the project submission?"
    When I click the 'No, it was a mistake!' button
    Then I should see "Kevin's solution"
    When I click on the delete project submission button
    And I click the 'Yes, delete it' link
    Then I should see "Your submission was deleted"
    And I should not see "Kevin's solution"
    And I should not see the edit and delete project submission buttons
    And I should see the 'Add your solution' link

  @javascript
  Scenario: Trying to delete other user's project submission - sad path
    Given I am logged in as 'dana' with password 'secret'
    And I am on the 'Web Development 101' course page
    And I go to the 'HTML/CSS' lesson page
    Then I should see "Kevin's solution"
    And I should see "Dana's solution"
    When I click on the delete project submission button
    And I click the 'Yes, delete it' link
    Then I should see "Your submission was deleted"
    And I should not see "Dana's solution"
    And I should see "Kevin's solution"
    And I should not see the edit and delete project submission buttons
    And I should see "Add your solution"

  @javascript
  Scenario: Trying to delete other user's project submission - sad path
    Given I am logged in as 'john' with password 'hunter'
    And I am on the 'Web Development 101' course page
    And I go to the 'HTML/CSS' lesson page
    Then I should see "Kevin's solution"
    And I should see "Dana's solution"
    And I should see "Add your solution"
    And I should not see the edit and delete project submission buttons
