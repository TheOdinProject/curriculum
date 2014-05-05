require 'spec_helper'

describe "Sign Up" do

  subject { page }
  before do
    lesson = FactoryGirl.create(:lesson)
  end

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
        ActionMailer::Base.deliveries.last.encoded.should include "To: #{attrs[:email]}"
      end

      it "should have an email confirmation link in the welcome email" do
        ActionMailer::Base.deliveries.last.encoded.should include "Confirm your email"
      end
    end
  end
end