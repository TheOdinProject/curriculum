require 'spec_helper'

describe "New users" do

  let!(:course){ FactoryGirl.create(:course, is_active: true) }
  let!(:section){ FactoryGirl.create(:section, course_id: course.id) }
  let!(:lesson){ FactoryGirl.create(:lesson, section_id: section.id) }

  before do
    sign_up_user
  end

  it "confirms email when user follows link in welcome email" do
    email = ActionMailer::Base.deliveries.last.encoded
    link = email.match(/"(.*confirmation_token.*)"/)[1]
    visit link
    page.should have_selector('div', text: "Thanks for confirming your email address!")
  end
end

describe "Users registered before email confirmations were added need to verify their account" do 

  let!(:user) { FactoryGirl.create(:user, :reg_before_conf => true, :confirmed_at => nil) }
  before { sign_in(user) }

  it "should prompt the user to confirm email when they sign in" do
    page.should have_selector("div", text: "Please confirm your email address.")
  end

  it "should not block the user from accessing the site" do
    page.should have_selector('h1', text: "This is Your Path to Learning Web Development")
  end

  it "should provide a link to request confirmation instructions" do
    page.should have_link("Didn't receive confirmation instructions, or need them again?")
  end

  it "should send an email with confirmation instructions" do
    click_on("Didn't receive confirmation instructions, or need them again?")
    ActionMailer::Base.deliveries.last.encoded.should have_link("Confirm my account")
  end

  it "has a flash message that instructions were sent" do
    click_on("Didn't receive confirmation instructions, or need them again?")
    page.should have_selector('div', text: "Confirmation instructions have been sent to your email address!")
  end

  context "When user clicks link to confirm email" do
    before do
      click_on("Didn't receive confirmation instructions, or need them again?")
      email = ActionMailer::Base.deliveries.last.encoded
      link = email.match(/href="(.*confirmation_token.*)" /)[1]
      visit link
    end

    it "confirms the user's email address" do
      page.should have_selector('div', text: "Thanks for confirming your email address")
    end

    it "redirects the user to the courses page" do
      current_path.should eq(courses_path)
    end

    it "signs the user in automatically" do
      page.should have_selector('div.navbar', text: user.username)
    end
  end

  it "should stop prompting user to confirm after they have done so" do
    sign_out(user)  # Sign out unconfirmed user from before block
    confirmed_user = FactoryGirl.create(:user, :reg_before_conf => true, :confirmed_at => Time.now)
    sign_in(confirmed_user)
    page.should have_no_selector("div", text: "Please confirm your email address")
  end
  
end