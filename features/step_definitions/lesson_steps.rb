Given /a user named '([^']+)' exists$/ do |user_name|
  FactoryGirl.create(:user, username: user_name)
end

Given /^a course named '([^']+)' exists$/ do |course_name|
  @course = FactoryGirl.create(:course, title: course_name)
end

Given /^a section named '([^']+)' exists$/ do |section_name|
  @section = FactoryGirl.create(:section, title: section_name, course: @course)
end

Given /^the following lessons exist in '([^']+)' section:$/ do |section_title, table|
  section = Section.find_by(title: section_title)
  @lessons = []
  table.hashes.each do |hash|
    @lessons << FactoryGirl.create(:lesson, title: hash[:lesson_name], section: section)
  end
end

Given /^I am logged in$/ do
  @user = FactoryGirl.create(:user)
  log_in @user
end

Given /^no lessons are completed$/ do
  within '.lc-percent-completion' do
    expect(page).to have_content('0% Completed')
  end

  @section.lessons.each do |lesson|
    within "#lc-id-#{lesson.id}" do
      expect(page).to have_css('a.lc-checkbox.lc-unchecked')
    end
  end
end

Given /^the lesson '([^']+)' is completed$/ do |lesson_title|
  lesson = Lesson.find_by(title: lesson_title)
  within "#lc-id-#{lesson.id}" do
    click_link 'Check to mark lesson completed'
  end
end

Given /^the lesson is completed$/ do
  step "I click the Mark lesson complete link"
  @progress_after_completion = page.find('.lc-active-circle > .lc-pct').text.to_i
end

Given /^the lesson is not completed$/ do
  within '.individual-lesson' do
    expect(page).to have_css('.lc-completion-indicator.hidden', visible: false)
  end

  expect(page).to have_css('.checkbox-container.lc-unchecked')
  expect(page).not_to have_css('.lc-uncomplete-link')
end

When /I go to the '([^']+)' course page/ do |course_title|
  course_title_parametrized = course_title.parameterize
  course_url = "/courses/#{course_title_parametrized}"
  visit course_url
end

When /^I mark the lesson '([^']+)'$/ do |lesson_title|
  @lesson = Lesson.find_by(title: lesson_title)
  within "#lc-id-#{@lesson.id}" do
    click_link 'Check to mark lesson completed'
  end
end

When /^I unmark the lesson '([^']+)'$/ do |lesson_title|
  @lesson = Lesson.find_by(title: lesson_title)
  within "#lc-id-#{@lesson.id}" do
    click_link 'Uncheck to mark lesson not completed'
  end
end

When /^I mark all the lessons as completed$/ do
  @lessons.each do |lesson|
    step "I mark the lesson '#{lesson.title}'"
  end
end

When /^I go back$/ do
  visit '/courses'
end

When /^I click the Mark lesson complete link$/ do 
  @previous_progress = page.find('.lc-active-circle > .lc-pct').text.to_i
  click_link 'Mark Lesson Completed'
  expect(page).to have_link 'Change lesson to not completed'
end

When /^I change the lesson not to be completed$/ do
  expect(page).not_to have_content('Mark Lesson Completed')
  click_link 'Change lesson to not completed'
  expect(page).to have_content('Mark Lesson Completed')
end

# The following two step definitions belong to the scenarios when the learner
# marks the lesson completed from the course pag
Then /^my progress should be saved$/ do
  within "#lc-id-#{@lesson.id}" do
    expect(page).to have_css('a.lc-checkbox.lc-checked')
  end

  # make sure the percentage completion gets increased
  within ".lc-percent-completion" do
    percent_completed = @course.percent_completed_by(@user).to_i
    expect(page).to have_content("#{percent_completed}% Completed")
  end
end

Then /^my progress should be declined$/ do
  within "#lc-id-#{@lesson.id}" do
    expect(page).to have_css('a.lc-checkbox.lc-unchecked')
  end

  # make sure the percentage completion gets increased
  within ".lc-percent-completion" do
    percent_completed = @course.percent_completed_by(@user).to_i
    expect(page).to have_content("#{percent_completed}% Completed")
  end
end

Then /^I should see 'Course Completed!' in the progress bar$/ do
  within ".lc-percent-completion" do
    expect(page).to have_content("Course Completed!")
  end
end

Then /^I should find the course '([^']+)' completed$/ do |course_title|
  course_url_href = course_title.parameterize
  selector = ".course-title a[href='/courses/#{course_url_href}']"

  within selector do
    expect(page).to have_css('.cc-completion-indicator')
    expect(page).not_to have_css('.cc-completion-indicator.hidden')
  end
end

# The following two step definitions belong to the scenarios when the learner
# marks the lesson completed from the lesson page
Then /^I should see my progress improve$/ do
  expect(page).to have_css('.checkbox-container.lc-checked')
  expect(page).not_to have_css('.checkbox-container.lc-unchecked')
  expect(page).to have_link('Change lesson to not completed')

  expect(page).to have_css('.lc-completion-indicator')

  # Check if the progress tracking bar has updated
  current_progress = page.find('.lc-active-circle > .lc-pct').text.to_i
  expect(current_progress).to be > @previous_progress
end

Then /^I should see my progress decline$/ do
  expect(page).not_to have_css('.checkbox-container.lc-checked')
  expect(page).to have_css('.checkbox-container.lc-unchecked')
  expect(page).not_to have_link('Change lesson to not completed')

  expect(page).not_to have_css('.lc-completion-indicator')

  # Check if the progress tracking bar has updated
  current_progress = page.find('.lc-active-circle > .lc-pct').text.to_i
  expect(current_progress).to be < @progress_after_completion
end

Then /^I should find the lesson '([^']+)' completed$/ do |lesson_title|
  lesson_id = Lesson.find_by(title: lesson_title).id
  within "#lc-id-#{lesson_id}" do
    expect(page).to have_link('Uncheck to mark lesson not completed')
    expect(page).not_to have_link('Check to mark lesson completed')
  end
end

Then /^I should find the lesson '([^']+)' not completed$/ do |lesson_title|
  lesson_id = Lesson.find_by(title: lesson_title).id
  within "#lc-id-#{lesson_id}" do
    expect(page).to have_link('Check to mark lesson completed')
    expect(page).not_to have_link('Uncheck to mark lesson not completed')
  end
end