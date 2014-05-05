require 'spec_helper'

describe "Confirm Email" do 

  # Testing necessary?  Devise should have this covered already...
  # context "New user" do
  # end

  context "User who signed up before email confirmation was required" do
    let!(:user) { FactoryGirl.create(:user, :reg_before_conf => true, :confirmed_at => nil) }

    before { login_user }
  
    it "should prompt the user to confirm email when they sign in" do
      page.should have_selector("div", text: "Please confirm your email address.")
    end

    it "should provide a link to request confirmation instructions" do
      page.should have_link("Send confirmation instructions")
    end

    it "should send an email with confirmation instructions" do
      click_on("Send confirmation instructions")
      ActionMailer::Base.deliveries.last.encoded.should include "Confirm my account"
    end

    it "should allow user to confirm email by following link" do
      click_on("Confirm my account")
      expect(user.confirmed_at).not_to be_nil
    end

    #  What if we have already sent confirmation instructions once?  Will link need to change to "resend"?
    #  Do we have to send a conditional link based on whether or not they have an active token?

    it "should stop prompting user to confirm after they have done so" do
      confirmed_user = FactoryGirl.create(:user, :reg_before_conf => true, :confirmed_at => Time.now)
      login_user
      page.should have_no_selector("div", text: "Please confirm your email address")
    end
  end
  
end