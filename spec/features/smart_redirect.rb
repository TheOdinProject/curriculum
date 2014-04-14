require 'spec_helper'

describe "Smart Redirect" do
    #create a course with content
    #instead of courses_path, we should
    #go to the course we just created
  subject { page }

  let!(:course){ FactoryGirl.create(:course, is_active: true) }
  let!(:section){ FactoryGirl.create(:section, course_id: course.id) }
  let!(:lesson){ FactoryGirl.create(:lesson, section_id: section.id) }

  describe "Redirect back after sign up" do
    context 'From the home page' do
      before { sign_up_user }

      it { should have_selector('h1', text: "This is Your Path to Learning Web Development" ) }

    end
    context 'From a specific lesson page' do
      before do
        visit lesson_path(lesson.course.title_url, lesson.title_url)
        sign_up_user
      end

      it { should have_selector('div', text: lesson.title ) }

    end

    context 'From signup path' do
      before do
        visit signup_path
        sign_up_user
      end

      it { should have_selector('h1', text: "This is Your Path to Learning Web Development" ) }

    end
  end

  describe "Redirect back after sign in" do
    # Create a user here to login with
    # after visiting couress path:
    # 1. click login
    # 2. sign in with a valid user
    # 3. redirect back to courses path

    let!(:new_user){ FactoryGirl.create(:user) }

    context 'From a specific lesson page' do
      before do
        visit lesson_path(course.title_url, lesson.title_url)
        sign_in(new_user)
      end

      it 'should redirect the registered user to last viewed lesson page' do
        should have_selector('div', text: lesson.title )
      end
    end

    context 'From the home page' do
      before do
        visit home_path
        sign_in(new_user)
      end

      it { should have_selector('h1', text: "This is Your Path to Learning Web Development") }

    end
  end
end
