RSpec::Matchers.define :have_submit_button do |value|
  match do |actual|
    expect(actual).to have_selector("[data-test-id='#{value}']")
  end
end

RSpec::Matchers.define :have_no_submit_button do |value|
  match do |actual|
    expect(actual).to have_no_selector("[data-test-id='#{value}']")
  end
end
