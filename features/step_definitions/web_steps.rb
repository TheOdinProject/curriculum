Then(/I should( not)? see "([^"]+)"/) do |not_to_see, text|
  if not_to_see
    expect(page).to_not have_content(text)
  else
    expect(page).to have_content(text)
  end
end

When /^I click the '([^']+)' link$/ do |text|
  if Capybara.javascript_driver == :poltergeist
    find_link(text).trigger('click')
  else
    click_link text
  end
end

When /^I click the '([^']+)' button$/ do |text|
  if Capybara.javascript_driver == :poltergeist
    find_button(text).trigger('click')
  else
    click_button text
  end
end

Then(/^I should see the '([^']+)' link$/) do |link_text|
  expect(page).to have_link('Add your solution')
end
