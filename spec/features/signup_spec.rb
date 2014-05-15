require 'spec_helper'

describe "Sign Up" do

  subject { page }

  let!(:course){ FactoryGirl.create(:course, is_active: true) }
  let!(:section){ FactoryGirl.create(:section, course_id: course.id) }
  let!(:lesson){ FactoryGirl.create(:lesson, section_id: section.id) }

  describe "Sign Up Form" do

    before { visit sign_up_path }

      # save_and_open_page
    it { should have_selector("h2", :text => "Sign up") } 

    context "after entering valid signup credentials and clicking submit" do

      let(:attrs) { FactoryGirl.attributes_for(:user) }

      before do
        fill_in :user_username, :with => attrs[:username]
        fill_in :user_email, :with => attrs[:email]
        fill_in :user_password, :with => attrs[:password]
        fill_in :user_password_confirmation, :with => attrs[:password]
        check :user_legal_agreement
        click_button "Sign up"
      end

      it "should deposit user into courses page" do
        # save_and_open_page
        subject.should have_selector("h1", :text => "This is Your Path to Learning Web Development")
      end
      
      it "Should send a welcome email to the user" do
        # must be "last" because other tests will populate this too
        email = ActionMailer::Base.deliveries.last.encoded
        email.should include "To: #{attrs[:email]}"
      end

      it "should have an email confirmation link in the welcome email" do
        email = ActionMailer::Base.deliveries.last.encoded
        email.should include "Confirm your email"
      end

      it "confirms the user's email address when they follow the link" do
        email = ActionMailer::Base.deliveries.last.encoded
        link = email.match(/"(.*confirmation_token.*)"/)[1]
        visit link
        page.should have_selector("div", text: "Thanks for confirming your email address!")
      end
    end

    context "after 2-day grace period for confirming email is over" do
      it "has link in flash notice to resend confirmation email" do
        #  Check whether another user (or forgetful) is already signed in
        #  Check whether forgetful is being saved correctly
        forgetful = FactoryGirl.build(:user)
        forgetful.created_at = Time.now - 10.days
        forgetful.confirmation_sent_at = Time.now - 10.days
        forgetful.save
        sign_in(forgetful)
        save_and_open_page
        page.should have_selector('div', text: "You must confirm your email")
      end
    end

    context "after signing up with Github" do
      before do
        sign_up_with_github  # username: "GhostMan"   email: "ghost@nobody.com"
      end

      it "sends welcome email" do
        ActionMailer::Base.deliveries.last.encoded.should include "To: ghost@nobody.com"
      end

      it "includes email confirmation link in the welcome email" do
        ActionMailer::Base.deliveries.last.encoded.should include "Confirm your email"
      end

      it "does not mark user confirmed automatically" do
        User.last.confirmed?.should eq false
      end

      it "confirms user's email address when they follow link" do
        email = ActionMailer::Base.deliveries.last.encoded
        link = email.match(/"(.*confirmation_token.*)"/)[1]
        visit link
        page.should have_selector("div", text: "Thanks for confirming your email address!")
      end

      # Do we want to nag people who registered with OAuth?
      it "prompts user to confirm email" do  
      end

      it "does not require user to verify within 2-day grace period" do # Because OAuth
        click_on("Logout")
        User.last.created_at = Time.now - 3.days
        visit sign_up_path
        click_on "Sign up with Github"
        page.should have_selector('h1', text: "This is Your Path to Learning Web Development")
      end      
    end
  end
end