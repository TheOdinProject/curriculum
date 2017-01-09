Feature: Navigate through the lessons
  As a learner
  To ease my learning
  I want to navigate through the lessons

Background: Adding data to the database

  Given a course named 'Web Development 101' exists
  And a section named 'The Basics' exists
  And the following lessons exist in 'The Basics' section:
  | lesson_name |
  | How this Course Will Work |
  | Gearing Up |
  | Join the Community |
  And a section named 'Git Basics' exists
  And the following lessons exist in 'Git Basics' section:
  | lesson_name |
  | Introduction to Git |
  | Git Basics |
  | Practicing Git |

Scenario: Navigating forward a lesson

  Given I am in the 'Web Development 101' course page
  When I go to the 'Gearing Up' lesson page
  And I click on the Next Lesson link
  Then I should be in 'Join the Community' lesson page

Scenario: Navigating back to a lesson

  Given I am in the 'Web Development 101' course page
  When I go to the 'Gearing Up' lesson page
  And I click on the Prev Lesson link
  Then I should be in 'How this Course Will Work' lesson page

Scenario: At the start of the second section

  Given I am in the 'Web Development 101' course page
  When I go to the 'Introduction to Git' lesson page
  And I click on the Prev Lesson link
  Then I should be in 'Join the Community' lesson page

Scenario: At the end of the first section

  Given I am in the 'Web Development 101' course page
  When I go to the 'Join the Community' lesson page
  And I click on the Next Lesson link
  Then I should be in 'Introduction to Git' lesson page

Scenario: At the start of a course

  Given I am in the 'Web Development 101' course page
  When I go to the 'How this Course Will Work' lesson page
  Then the Previous Lesson button should be disabled

Scenario: At the end of a course

  Given I am in the 'Web Development 101' course page
  When I go to the 'Practicing Git' lesson page
  Then the Next Lesson button should be disabled

Scenario: Navigating back to course

  Given I am in the 'Web Development 101' course page
  When I go to the 'Introduction to Git' lesson page
  And I click on the View Course button
  Then I should be back in the 'Web Development 101' course page
