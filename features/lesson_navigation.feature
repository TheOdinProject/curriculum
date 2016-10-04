Feature: Navigate through the lessons
  As a learner
  To ease my learning
  I want to navigate through the lessons
  
Background: Adding data to the database

  Given a course named 'Introduction to Web Development' exists
  And a section named 'About Web developers' exists
  And the following lessons exist in 'About Web developers' section:
  | lesson_name |
  | What a web developer does |
  | Tools of the trade |
  | Web Development Communities |
  
Scenario: Navigating forward a lesson

  Given I am in the 'Introduction to Web Development' course page
  When I go to the 'What a web developer does' lesson page
  And I click on the Next Lesson link
  Then I should be in 'Tools of the trade' lesson page
  
Scenario: Navigating back to a lesson
  
  Given I am in the 'Introduction to Web Development' course page
  When I go to the 'Tools of the trade' lesson page
  And I click on the Prev Lesson link
  Then I should be in 'What a web developer does' lesson page