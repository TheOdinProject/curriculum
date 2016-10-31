require 'rails_helper'

describe "Sign Up" do

  subject { page }

  let!(:course){ FactoryGirl.create(:course, is_active: true) }
  let!(:section){ FactoryGirl.create(:section, course_id: course.id) }
  let!(:lesson){ FactoryGirl.create(:lesson, section_id: section.id) }

  describe "Sign Up Form" do

    before { visit sign_up_path }

      # save_and_open_page
    it { is_expected.to have_selector("h2", :text => "Sign up") }

    context "after entering valid signup credentials and clicking submit" do

      let(:attrs) { FactoryGirl.attributes_for(:user) }

      before do
        fill_in :user_username, :with => attrs[:username]
        fill_in :user_email, :with => attrs[:email]
        fill_in :user_password, :with => attrs[:password]
        fill_in :user_password_confirmation, :with => attrs[:password]
        check :user_legal_agreement
        click_button "Sign up"
        @email = ActionMailer::Base.deliveries.last.encoded
      end

      it "should deposit user into courses page" do
        # save_and_open_page
        expect(subject).to have_selector("h1", :text => "This is Your Path to Learning Web Development")
      end

      it "Should send a welcome email to the user" do
        # must be "last" because other tests will populate this too
        expect(@email).to include "To: #{attrs[:email]}"
      end

      it "should have an email confirmation link in the welcome email" do
        expect(@email).to include "Confirm your email"
      end

      it "confirms the user's email address when they follow the link" do
        link = @email.match(/\S+confirmation_token\S+/)[0]
        visit link
        expect(page).to have_selector("div", text: "Thanks for confirming your email address!")
      end
    end

    context "after 2-day grace period for confirming email is over" do
      before do
        @forgetful = FactoryGirl.create(:user)
        @forgetful.created_at = Time.now - 10.days
        @forgetful.confirmation_sent_at = Time.now - 10.days
        @forgetful.confirmed_at = nil
        @forgetful.save
        sign_in(@forgetful)
      end

      it "has link in flash notice to resend confirmation email" do
        expect(page).to have_selector('div', text: "You have to confirm your account before continuing.Didn't receive instructions or need them again?")
      end

      it "resends confirmation instructions when user clicks link" do
        click_on("Didn't receive instructions or need them again?")
        fill_in("Email", with: @forgetful.email)
        click_on("Resend confirmation instructions")
        expect(ActionMailer::Base.deliveries.last.encoded).to include "Confirm your email"
      end
    end
  end
end
