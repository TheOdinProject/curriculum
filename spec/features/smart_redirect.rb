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
    context 'to courses path from all aliases of root_path' do
      context 'From / path' do
        before do
          visit '/'
          sign_up_user
        end

        it { is_expected.to have_selector('h1', text: "This is Your Path to Learning Web Development" ) }

      end

      context 'From /home path' do
        before do
          visit '/home'
          sign_up_user
        end

        it { is_expected.to have_selector('h1', text: "This is Your Path to Learning Web Development" ) }

      end

      context 'From /home?ref=logout path' do
        before do
          visit '/home?ref=logout'
          sign_up_user
        end

        it { is_expected.to have_selector('h1', text: "This is Your Path to Learning Web Development" ) }

      end

      context 'From home_path' do
        before do
          visit home_path
          sign_up_user
        end

        it { is_expected.to have_selector('h1', text: "This is Your Path to Learning Web Development" ) }

      end

      context 'From root_path' do
        before do
          visit root_path
          sign_up_user
        end

        it { is_expected.to have_selector('h1', text: "This is Your Path to Learning Web Development" ) }

      end
    end

    context 'From a lesson page' do
      before do
        visit lesson_path(lesson.course.title_url, lesson.title_url)
        sign_up_user
      end

      it 'should redirect the registered user to last viewed lesson page' do
        is_expected.to have_selector('div', text: lesson.title )
      end

    end

    context 'to courses path from /signup path' do
      before do
        visit '/signup'
        sign_up_user
      end

      it { is_expected.to have_selector('h1', text: "This is Your Path to Learning Web Development" ) }

    end

    context 'to courses path from /sign_up path' do
      before do
        visit '/sign_up'
        sign_up_user
      end

      it { is_expected.to have_selector('h1', text: "This is Your Path to Learning Web Development" ) }

    end
  end

  describe "Redirect back after sign in" do
    # Create a user here to login with
    # after visiting couress path:
    # 1. click login
    # 2. sign in with a valid user
    # 3. redirect back to courses path

    let!(:new_user){ FactoryGirl.create(:user) }

    context 'to courses path from all aliases of root_path' do
      context 'From / path' do
        before do
          visit '/'
          sign_in(new_user)
        end

        it { is_expected.to have_selector('h1', text: "This is Your Path to Learning Web Development" ) }

      end

      context 'From /home path' do
        before do
          visit '/home'
          sign_in(new_user)
        end

        it { is_expected.to have_selector('h1', text: "This is Your Path to Learning Web Development" ) }

      end

      context 'From /home?ref=logout path' do
        before do
          visit '/home?ref=logout'
          sign_in(new_user)
        end

        it { is_expected.to have_selector('h1', text: "This is Your Path to Learning Web Development" ) }

      end

      context 'From home_path' do
        before do
          visit home_path
          sign_in(new_user)
        end

        it { is_expected.to have_selector('h1', text: "This is Your Path to Learning Web Development" ) }

      end

      context 'From root_path' do
        before do
          visit root_path
          sign_in(new_user)
        end

        it { is_expected.to have_selector('h1', text: "This is Your Path to Learning Web Development" ) }

      end
    end

    context 'From a lesson page' do
      before do
        visit lesson_path(course.title_url, lesson.title_url)
        sign_in(new_user)
      end

      it 'should redirect the registered user to last viewed lesson page' do
        is_expected.to have_selector('div', text: lesson.title )
      end
    end


    context 'to courses path from login_path' do
      before do
        visit login_path
        sign_in(new_user)
      end

      it { is_expected.to have_selector('h1', text: "This is Your Path to Learning Web Development" ) }

    end

    context 'to courses path from new_user_session_path' do
      before do
        visit new_user_session_path
        sign_in(new_user)
      end

      it { is_expected.to have_selector('h1', text: "This is Your Path to Learning Web Development" ) }

    end

    context 'to courses path from user_session_path' do
      before do
        visit user_session_path
        sign_in(new_user)
      end

      it { is_expected.to have_selector('h1', text: "This is Your Path to Learning Web Development" ) }

    end

    describe 'Redirect after update user information'  do
      before do
        sign_in(new_user)
        visit edit_user_registration_path
        fill_in :user_username, :with => new_user.username
        fill_in :user_email, :with => new_user.email
        fill_in :user_password, :with => "foobar"
        fill_in :user_password_confirmation, :with => "foobar"
        fill_in :user_current_password, :with => new_user.password
        click_button "Update"
      end

      it 'should redirect to courses path' do
        is_expected.to have_selector('h1', text: "This is Your Path to Learning Web Development" )
      end

    end
  end
end
