Given /^I am in the '([^']+)' course page$/ do |course_title|
  @course_title = course_title.parameterize
  visit @course_title
end

When /^I go to the '([^']+)' lesson page$/ do |lesson_title|
  lesson_title = lesson_title.parameterize
  visit "#{@course_title}/#{lesson_title}"
end

When /^I click on the Next Lesson link$/ do
  within '.lnav-next.lnav-wrap' do
    page.find('a').click
  end
end

When /^I click on the Prev Lesson link$/ do
  within '.lnav-prev.lnav-wrap' do
    page.find('a').click
  end
end

Then /^I should be in '([^']+)' lesson page$/ do |lesson_title|
  lesson_title = lesson_title.parameterize
  expect(page.current_path).to eql lesson_path(@course_title, lesson_title)
end