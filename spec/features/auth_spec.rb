require 'spec_helper'

describe "Authentication" do

  subject { page }
  let(:home_h1) { "Learn Web Development for Free"}

  describe "User authentication flow" do

    let(:user) { FactoryGirl.create(:user) }  

    context "from the splash page" do

      before { visit root_path }

      it { should have_link "Login" }
      it { should_not have_link "Logout" }

      context "after clicking login" do

        before { click_link "Login" }

        it { should have_link "Sign up" }

      end
    end

    context "from the home page" do
    
      before { visit home_path }

      describe "should start on the home page" do

        it { should have_selector('h1', :text => home_h1) }
        it { should_not have_link "Logout" }

        describe "then click through to login" do

          before { click_link "Login" }

          it { should have_selector('h2', :text => "Sign in") }

          describe "then login to land on the courses page" do

            before do
              fill_in "Email", :with => user.email
              fill_in "Password", :with => user.password
              click_button "Sign in"
            end

            it { should have_selector('h1', :text => "This is Your Path to Learning Web Development" ) }

            describe "then click logout to sign out to home page" do

              before do
                click_link "Logout"
              end

              it { should have_selector('h1', :text => home_h1) }
            end
          end
        end
      end
    end
  end
end








