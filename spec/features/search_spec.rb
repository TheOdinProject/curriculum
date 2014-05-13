require 'spec_helper'
require 'capybara-webkit'
require 'fakeweb'

feature "Search" do
 
  describe "Home page" do
    it "should not have a searchbox" do
      visit root_path
      expect(page).to_not have_css('#st-search-input')
    end
  end  
  
  # Static pages should have a search-box
  describe "Static pages" do
    it "About should have a searchbox" do
      visit about_path
      expect(page).to have_css('#st-search-input')
    end
    
    it "Studygroups should have a searchbox" do
      visit studygroups_path
      expect(page).to have_css('#st-search-input')
    end
  end

  # Non-static pages should have a search-box
  describe "Curriculum pages" do
    before { visit curriculum_path }
    
    it "brings up results modal with valid input", :js => true do
      fill_in 'st-search-input', :with => 'controller'
      page.has_css?('#st-results-modal')
    end
   
    it "doesn't bring up results modal with empty input", :js => true do
      fill_in 'st-search-input', :with => "\n"
      page.has_no_css?('#st-results-modal')
    end
 
    it "sends a GET request to swiftype for search results", 
      fill_in 'st-search-input', :with => "SQL\n"
      FakeWeb.last_request  # TODO
    end
  end

end

