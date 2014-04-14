require 'spec_helper'

describe "Smart Redirect" do
    #create a course with content
    #instead of courses_path, we should
    #go to the course we just created
  subject { page }

  let!(:course){ FactoryGirl.create(:course, :is_active => true) }
  let!(:section){ FactoryGirl.create(:section, :course_id => course.id) }
  let!(:lesson){ FactoryGirl.create(:lesson, :section_id => section.id) }

  describe "Redirect back after sign up" do
    context 'From the home page' do
      before do
        sign_up_user
      end

      it 'should redirect to the courses page' do
        should have_content('This is Your Path to Learning Web Development')
      end
    end
    context 'From a specific lesson page' do
      before do
        visit lesson_path(lesson.course.title_url, lesson.title_url)
        sign_up_user
      end

      it 'should redirect the registered user to last viewed course page' do
        should have_content(lesson.title)
      end
    end
  end

  # describe "Redirect back after sign in" do
  #   let!(:course1)  { Course.first }
  #   let!(:lesson1)  { course1.lessons.where(:is_project => false).first }
  #   let!(:project1) { course1.lessons.where(:is_project => :true).first }
  #   # Create a user here to login with
  #   # after visiting couress path:
  #   # 1. click login
  #   # 2. sign in with a valid user
  #   # 3. redirect back to courses path

  #   let!(:new_user){ FactoryGirl.create(:user) }

  #   before do
  #     visit lesson_path(course1.title_url, lesson1.title_url)
  #     sign_in(new_user)
  #   end

  #   it 'should redirect the registered user to last viewed course page' do
  #     should have_content('1: test lesson1')
  #   end

  # end
end
