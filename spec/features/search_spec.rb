require 'spec_helper'
require 'capybara-webkit'
 
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
 
    it "has the search term in the results", :js => true do
      fill_in 'st-search-input', :with => "SQL\n"
      within('.st-search-summary') { expect(page).to have_content('SQL' && "1") }
    end
    
    it "finds the one instance of Sandi in the content", :js => true do
      fill_in 'st-search-input', :with => "sandi\n"
      within('.st-search-summary') { expect(page).to have_content('Sandi Metz' && "1") }      
    end
    
    it "go to the right results page", :js => true do
      fill_in 'st-search-input', :with => "pothibo\n"
      within('.st-search-summary') { expect(page).to have_content('Sessions, Cookies, and Authentication' && "1") } 
      click_link('Sessions, Cookies, and Authentication')
      page.has_content?('are the idea that your user')
    end    
    
  end
 
end

