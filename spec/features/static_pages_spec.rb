require 'spec_helper'

describe "StaticPages" do

  subject { page }

  describe "Splash Page" do

    before { visit root_path }


    it "should have a title" do
      # save_and_open_page
      subject.source.should have_selector('title', text: "Odin") 
    end

    it { should have_selector('h1', text: "Odin") }

    describe "filling in the email form" do
      before(:each) do
        fill_in("splash_email_email", with: "foo@bar.com")
      end

      it "should create the splash_email instance" do
        expect { click_button("commit") }.to change(SplashEmail, :count).by(2)
      end
    end

  end

end