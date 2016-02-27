require 'spec_helper'

describe "Authentication" do

  subject { page }
  let(:home_h1) { "Learn Web Development for Free"}

  describe "User authentication flow" do

    let(:user) { FactoryGirl.create(:user) }

    context "from the splash page" do

      before { visit root_path }

      it { is_expected.to have_link "Login" }
      it { is_expected.not_to have_link "Logout" }

      context "after clicking login" do

        before { click_link "Login" }

        it { is_expected.to have_link "Sign up" }

      end
    end

    context "from the home page" do

      before { visit home_path }

      describe "should start on the home page" do

        it { is_expected.to have_selector('h1', :text => home_h1) }
        it { is_expected.not_to have_link "Logout" }

        describe "then click through to login" do

          before { click_link "Login" }

          it { is_expected.to have_selector('h2', :text => "Sign in") }

          describe "then login to land on the courses page" do

            before do
              fill_in "Email", :with => user.email
              fill_in "Password", :with => user.password
              click_button "Sign in"
            end

            it { is_expected.to have_selector('h1', :text => "This is Your Path to Learning Web Development" ) }

            describe "then click logout to sign out to home page" do

              before do
                click_link "Logout"
              end

              it { is_expected.to have_selector('h1', :text => home_h1) }
            end
          end
        end
      end
    end
  end

  describe "authentication pages" do

    describe "sign up page" do
      before do
        visit signup_path
      end

      it "should have a field for username" do
        expect(page).to have_selector("#user_username")
      end
      it "should have a field for email" do
        expect(page).to have_selector("#user_username")
      end
      it "should have a field for password" do
        expect(page).to have_selector("#user_password")
      end
      it "should have a field for password confirmation" do
        expect(page).to have_selector("#user_password_confirmation")
      end
      it "should have a field for legal agreement" do
        expect(page).to have_selector("#user_legal_agreement")
      end
    end
  end
end








