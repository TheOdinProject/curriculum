require 'spec_helper'
require 'database_cleaner'
require 'capybara-webkit'

describe "StaticPages" do

  subject { page }
  let(:home_h1) { "Learn Web Development for Free"}

  describe "Getting Involved Page" do

    before { visit getting_involved_path }

    it "should have title 'Getting Involved'" do
      expect(page).to have_selector("h1", text: "Getting Involved with The Odin Project")
    end
  end

  describe "Splash Page" do
    before { visit root_path }
    it { should have_selector('h1', text: home_h1) }
    it { should have_button "Explore the full curriculum" }
    it { should have_link 'Login', :href => login_path(:ref => "homenav") }
  end

  describe "study groups page" do

    before { visit root_path }
    context "should be linked to from the site footer" do
      it { expect(page).to have_link("Study Groups", :href => studygroups_path) }
    end
    before { click_link "Study Groups" }
    context "should load when link is clicked" do
      it { current_path.should == studygroups_path }
    end
    before { visit studygroup_path }
    context "should contain an h1 title" do
      it {expect(page).to have_selector("h1", :text => "Web Development Study Group")}
    end
  end

  describe "contributing page" do
    before { visit contributing_path }

    it "should have title Contributing to the Project" do
      expect(page).to have_selector("h1", text: "How to Contribute")
    end

    context "should have a hall of fame" do

      it "with title Hall of Fame" do
        expect(page).to have_selector("h2", text: "HALL OF FAME")
      end

      it "with an image for Erik" do
        expect(page).to have_css("img[src$='hof/erik.jpg']")
      end

      it "with a github link for Erik" do
        expect(page).to have_css("a[href~='http://github.com/eriktrautman']")
      end

      it "with a blog link for Erik" do
        expect(page).to have_css("a[href~='http://www.eriktrautman.com/blog']")
      end

    end
  end


  describe "legal pages" do

    context "on the home page" do
      before { visit root_path }

      it "should have a link in the footer for legal" do
        within("#footer") do
          expect(page).to have_link("Legal",:href => legal_path)
        end
      end
    end

    context "on the legal page" do
      before { visit legal_path }

      it "should have a relevant h1" do
        expect(page).to have_selector("h1",:text => "Legal Stuff")
      end

      it "should link to the Terms of Use" do
        expect(page).to have_link("Terms of Use", :href => tou_path)
      end

      it "should link to the CLA" do
        expect(page).to have_link("Contributor Licensing Agreement", :href => cla_path)
      end
    end

    context "on the Terms of Use page" do

      before { visit tou_path }

      it "should have a relevant h1 from the markdown" do
        expect(page).to have_selector("h1", :text => "Terms of Use")
      end
      it "should have a back button to the legal page" do
        expect(page).to have_link("", :href => legal_path)
      end
    end

    context "on the Contributor Licensing Agreement page" do

      before { visit cla_path }

      it "should have a relevant h1 from the markdown" do
        expect(page).to have_selector("h1", :text => "Contributor Licensing Agreement")
      end
      it "should have a back button to the legal page" do
        expect(page).to have_link("", :href => legal_path)
      end
    end
  end
end
