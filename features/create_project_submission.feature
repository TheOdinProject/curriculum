Feature: Creating a project submission
  As an odinite
  To share and get feedback on my project
  I want to make project submissions

Background: Adding data to the database
  Given a course named 'Web Development 101' exists
  And a section named 'The Basics' exists
  And the following lessons exist in 'The Basics' section:
  | title                     | is_project |
  | How this course will work | false      |
  | Installations             | true       |
  And a section named 'The Front End' exists
  And the following lessons exist in 'The Front End' section:
  | title    | is_project |
  | HTML/CSS | true       |

  Scenario: Trying to submit a project solution before logging in
    Given I am on the 'Web Development 101' course page
    When I go to the 'HTML/CSS' lesson page
    Then I should see "Recent submissions"
    And I should see "There are no submissions for this project yet. Be the first!"
    And I should not see the Add your solution button

  @javascript
  Scenario: Trying to submit a project solution after logging in - happy path
    Given I am logged in as 'kevin'
    And I am on the 'Web Development 101' course page
    And I go to the 'HTML/CSS' lesson page
    When I click the 'Add your solution' link
    Then I should see "Upload your project"
    When I fill in the project submission form with valid values
    And I click the 'Upload project' button
    Then I should see "Your submission was added"
    And I should see "Kevin's solution"
    And I should see the edit and delete project submission buttons
    And I should not see the Add your solution button

  @javascript
  Scenario: Trying to submit a project solution after logging in - sad path
    Given I am logged in
    And I am on the 'Web Development 101' course page
    And I go to the 'HTML/CSS' lesson page
    When I click the 'Add your solution' link
    Then I should see "Upload your project"
    When I fill in the project submission form with invalid values
    And I click the 'Upload project' button
    Then I should see "Repo url must start with http://github.com/ or https://github.com/"
    And I should not see "Kevin's solution"
    And I should not see "Are you sure you want to delete the project submission?"

  Scenario: Non-project lessons page which have no submissions
    Given I am on the 'Web Development 101' course page
    When I go to the 'How this course will work' lesson page
    Then I should not see "Recent submissions"
    And I should not see "There are no submissions for this project yet. Be the first!"
    And I should not see the Add your solution button

  Scenario: Project lessons which don't accept submissions
    Given I am on the 'Web Development 101' course page
    When I go to the 'Installations' lesson page
    Then I should not see "Recent submissions"
    And I should not see "There are no submissions for this project yet. Be the first!"
    And I should not see the Add your solution button
