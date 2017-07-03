Given(/^I am on the '([^']+)' course page$/) do |course_title|
  @course_title = course_title.parameterize
  visit "/courses/#{@course_title}"
end

When(/I go to the '([^']+)' course page/) do |course_title|
  course_title_parametrized = course_title.parameterize
  course_url = "/courses/#{course_title_parametrized}"
  visit course_url
end

When(/^I go to the '([^']+)' lesson page$/) do |lesson_title|
  lesson_title = lesson_title.parameterize
  visit "/courses/#{@course_title}/lessons/#{lesson_title}"
end

When(/^I click on the Next Lesson link$/) do
  within '.lnav-next.lnav-wrap' do
    page.find('a').click
  end
end

When(/^I click on the Prev Lesson link$/) do
  within '.lnav-prev.lnav-wrap' do
    page.find('a').click
  end
end

Then(/^I should be in '([^']+)' lesson page$/) do |lesson_title|
  lesson_title = lesson_title.parameterize
  expect(page.current_path)
    .to eql "/courses/#{@course_title}/lessons/#{lesson_title}"
end

Then(/^the Previous Lesson button should be disabled$/) do
  within '.lnav' do
    expect(page).to have_css('.lnav-prev.lnav-wrap.lnav-disabled')
  end
end

Then(/^the Next Lesson button should be disabled$/) do
  within '.lnav' do
    expect(page).to have_css('.lnav-next.lnav-wrap.lnav-disabled')
  end
end

When(/^I click on the View Course button$/) do
  within '.lnav-index.lnav-wrap' do
    page.find('a').click
  end
end

Then(/^I should be back in the '([^']+)' course page$/) do |course_title|
  expect(page.current_path).to eql "/courses/#{course_title.parameterize}"
end
