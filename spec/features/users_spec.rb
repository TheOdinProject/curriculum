require "spec_helper"

describe "Users" do

  subject { page }

  let!(:user){ FactoryGirl.create(:user, :github => "http://www.github.com/foobar", :about => "I rock") }
  let!(:other_user) { FactoryGirl.create(:user, email: "other_user@example.com") }
  let!(:project) { FactoryGirl.create(:content_bucket) }
  
  describe "Profile Page (#show)" do

    before do
      user.content_buckets << project
      sign_in(user)
    end

    context "for current user" do
      before do 
        visit user_path(user)
      end

      it "should show the user's name" do
        expect(page.source).to have_selector("h2", :text => user.username)
      end
      it "should show the github profile link" do
        expect(page.source).to have_css( "a[href='#{user.github}']" )
      end
      it "should show the about text" do
        expect(page.source).to have_selector("p", :text => user.about)
      end
      it "should show the edit button" do
        expect(page.source).to have_selector("button", :text => "Edit")
      end

      context "without a completed lesson" do

        it "should not list lesson completions" do
          expect(page.source).not_to have_selector("h3", :text => "Completed Lessons")
        end
      end

      context "with a completed lesson" do

        before do 
          user.completed_lessons << FactoryGirl.create( :lesson )
          visit user_path( user ) 
        end

        it "should list the lessons the user has completed" do
          # save_and_open_page
          expect(page.source).to have_selector("h3", :text => "Completed Lessons")
        end

      end

    end

    context "for another user" do
      before { visit user_path(other_user) }

      it "should show that user's name" do
        expect(page.source).to have_selector("h2", :text => other_user.username)
      end
      it "should not have an edit button" do
        expect(page.source).not_to have_selector("button", :text => "Edit")
      end
    end
  end

  describe "Edit Profile Page (#edit)" do

    before do
      sign_in(user)
    end

    context "for not current user" do
      before do
        visit edit_user_path(other_user)
      end

      it "should not allow that edit page to display" do
        expect(current_path).not_to eq(edit_user_path(other_user))
      end

      it "should redirect to show page for that user" do
        expect(current_path).to eq(user_path(other_user))
      end
    end

    context "for logged in user" do
      before do
        visit edit_user_path(user)
      end

      it "should allow the edit page to display" do
        expect(current_path).to eq(edit_user_path(user))
      end

      context "with new data entered" do
        before do
          fill_in "user_facebook", :with => "new facebook"
          fill_in "user_about", :with => "New about me"
          click_button "Update"
        end

        it "should go to show page" do
          expect(current_path).to eq(user_path(user))
        end
        it "should show facebook changes" do
          user.reload
          expect(page.source).to have_css( "a[href='https://www.facebook.com/#{user.facebook}']" )
        end
        it "should show about changes" do
          expect(page.source).to have_selector("p", :text => "New about me")
        end
      end
    end
  end

  describe "Users index page" do

    context "after signing in" do
      before do
        sign_in(user)
        visit users_path
      end

      it { is_expected.to have_selector("h2", :text => "Students") }
      it { is_expected.to have_link(user.username, :href=>user_path(user)) }
      it { is_expected.to have_selector("img")}

      # Obsolete after changing the algorithm to favor instead
      # students who have most recently completed a lesson
      # Create these specs!
      it "should show the student with the most recently completed lesson first"    
      # context "after signing in another user" do
        
      #   before do
      #     sign_out(user)
      #     sign_in(other_user)
      #     visit users_path
      #   end
        
      #   it "should show most recently signed in user at top of list" do 
      #     users = page.all("div#students-list div.student-info")
      #     users[0].should have_content(other_user.username)
      #     users[1].should have_content(user.username)
      #   end 
        
      #   it "should NOT show most recently signed in user NOT at top of list" do 
      #     users = page.all("div#students-list div.student-info")
      #     users[1].should_not have_content(other_user.username)
      #     users[0].should_not have_content(user.username)
      #   end 
      # end

    end
      
    context "list users" do
      before do
        sign_in(user)        
        visit users_path
      end
      
      # Check to see if we get any listing at all
      it { is_expected.to have_selector('div.student-info') }
      
    end    
  end
end












