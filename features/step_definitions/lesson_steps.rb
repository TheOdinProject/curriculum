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

Given /I go to the '([^']+)' course/ do |course_name|
  course_link_text = "#{Course.count}: #{course_name}"
  click_link course_link_text
  expect(page).to have_content(@section.title)
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

And /^the lesson '([^']+)' is completed$/ do |lesson_title|
  lesson = Lesson.find_by(title: lesson_title)
  within "#lc-id-#{lesson.id}" do
    click_link 'Check to mark lesson completed'
  end
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

Then /^my progress should be saved$/ do
  within "#lc-id-#{@lesson.id}" do
    expect(page.has_selector? 'a.lc-checkbox.lc-checked').to be true
  end

  # make sure the percentage completion gets increased
  within ".lc-percent-completion" do
    percent_completed = @course.percent_completed_by(@user).to_i
    expect(page).to have_content("#{percent_completed}% Completed")
  end
end

Then /^my progress should be declined$/ do
  within "#lc-id-#{@lesson.id}" do
    expect(page.has_selector? 'a.lc-checkbox.lc-unchecked').to be true
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
  selector = ".course-title a[href='/#{course_url_href}']"

  within selector do
    expect(page.has_selector? '.cc-completion-indicator').to be true
    expect(page.has_selector? '.cc-completion-indicator.hidden').to be false
  end
end