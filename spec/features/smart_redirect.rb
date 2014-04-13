require 'spec_helper'

describe "Smart Redirect" do
    #create a course with content
    #instead of courses_path, we should
    #go to the course we just created
  subject { page }

  before do
    courses = FactoryGirl.create_list(:course, 1, :is_active => true)
    sections = []
    courses.each do |course|
      5.times do
        sections << FactoryGirl.create(:section, :course_id => course.id)
      end
    end
    sections.each do |section|
      FactoryGirl.create(:lesson, :section_id => section.id)
      FactoryGirl.create(:lesson, :section_id => section.id, :is_project => true)
    end
  end

  let!(:course1)  { Course.first }
  let!(:lesson1)  { course1.lessons.where(:is_project => false).first }
  let!(:project1) { course1.lessons.where(:is_project => :true).first }

  describe "Redirect back after sign up" do

    before do
      visit lesson_path(course1.title_url, lesson1.title_url)
      click_link("Login")
      click_link("Sign up")
      fill_in :user_username, :with => "User"
      fill_in :user_email, :with => "user@example.com"
      fill_in :user_password, :with => "password"
      fill_in :user_password_confirmation, :with => "password"
      check :user_legal_agreement
      click_button "Sign up"
    end

    it 'should redirect the registered user to last viewed course page' do
      should have_content('1: test lesson1')
      # puts page.source
    end
  end

  describe "Redirect back after sign in" do
    let!(:course1)  { Course.first }
    let!(:lesson1)  { course1.lessons.where(:is_project => false).first }
    let!(:project1) { course1.lessons.where(:is_project => :true).first }
    # Create a user here to login with
    # after visiting couress path:
    # 1. click login
    # 2. sign in with a valid user
    # 3. redirect back to courses path

    let!(:new_user){ FactoryGirl.create(:user) }

    before do
      visit lesson_path(course1.title_url, lesson1.title_url)
      sign_in(new_user)
    end

    it 'should redirect the registered user to last viewed course page' do
      should have_content('1: test lesson1')
    end

  end
end
