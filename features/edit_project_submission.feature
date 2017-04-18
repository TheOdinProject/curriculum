Feature: Delete a project submission
  As an odinite
  In order to get feedback for my projects
  I want to be able to update my project submission

Background: Adding data to the database
  Given a course named 'Web Development 101' exists
  And a section named 'The Front End' exists
  And the following lessons exist in 'The Front End' section:
  | title    | is_project |
  | HTML/CSS | true       |
  And the following users exist:
  | username | password |
  | kevin    | foobar   |
  And the following project submissions exist:
  | repo_url                     | live_preview            | lesson   | username |
  | https://github.com/test/repo | https://codepen.io/test | HTML/CSS | kevin |

  Scenario: Trying to edit a project submission before logging in
    Given I am on the 'Web Development 101' course page
    When I go to the 'HTML/CSS' lesson page
    Then I should see "Recent submissions"
    And I should see "Kevin's solution"
    And I should not see "There are no submissions for this project yet. Be the first!"
    And I should not see the edit project submission button

  @javascript
  Scenario: Trying to edit a project submission after logging in - happy path
    Given I am logged in as 'kevin' with password 'foobar'
    And I am on the 'Web Development 101' course page
    And I go to the 'HTML/CSS' lesson page
    And I click on the edit project submission button
    And I should see the repo url pointing to 'https://github.com/test/repo'
    And I should see the live preview url pointing to 'https://codepen.io/test'
    When I fill in the repo url with 'https://github.com/test/testing'
    And I fill in the live preview url with 'https://codepen.io/testing'
    And I click the 'Update submission' button
    Then I should see "Your submission was updated!"
    And I should see the repo url pointing to 'https://github.com/test/testing'
    And I should see the live preview url pointing to 'https://codepen.io/testing'

  @javascript
  Scenario: Trying to edit a project submission after logging in - sad path
    Given I am logged in as 'kevin' with password 'foobar'
    And I am on the 'Web Development 101' course page
    And I go to the 'HTML/CSS' lesson page
    And I click on the edit project submission button
    And I should see the repo url pointing to 'https://github.com/test/repo'
    And I should see the live preview url pointing to 'https://codepen.io/test'
    When I fill in the project submission form with invalid values
    And I click the 'Update submission' button
    Then I should see "Repo url must start with http://github.com/ or https://github.com/"
    And I should not see "Your submission was updated!"
