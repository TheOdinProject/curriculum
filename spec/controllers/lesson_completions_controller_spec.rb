require 'spec_helper'

describe LessonCompletionsController do

  let!(:student) { FactoryGirl.create(:user) }
  let!(:lesson) { FactoryGirl.create(:lesson) }
  let!(:lc_attrs) { { :lesson_id => lesson.id, :student_id => student.id } }
  let!(:lc_invalid_attrs) { { :lesson_id => lesson.id+1, :student_id => student.id+1 } }

  context "before authentication" do
    it "POST #create unauthorized" do
      # note: the :student_id attribute of lc_attrs is redundant when making requests
      #       because it's taken care of by the current_student in the controller.
      #       It is, however, necessary when creating a lesson_completion directly (w/ #create)
      post :create, lc_attrs 
      assert_response 401
    end
    
    it "DELETE #destroy unauthorized" do
      delete :destroy, :lesson_id => lc_attrs[:lesson_id]
      assert_response 401
    end
  end
  
  context "after authentication" do
    before do
      sign_in(student)
    end

    describe "POST #create" do
      context "with valid attributes" do
        it "saves the new event to the database" do
          expect{
            post :create, lc_attrs
          }.to change(LessonCompletion, :count).by(1)
        end
      end

      context "with invalid attributes" do
        it "does not save the new event to the database" do
          expect{
            post :create, lc_invalid_attrs
          }.to change(LessonCompletion, :count).by(0)
        end

        
        it "provides a failure redirect" do
          post :create, lc_invalid_attrs
          assert_response 400 # bad request
        end
      end
    end
    
    describe "DELETE #destroy" do
      context "without an existing lesson_completions object" do
        it "returns a bad request status" do
          delete :destroy, :lesson_id => lc_attrs[:lesson_id]
          assert_response 400 # bad request
        end
      end
      
      context "with an existing lesson_completions object and valid request attributes" do  
        
        let!(:lc){ LessonCompletion.create(lc_attrs)}
        
        it "destroys the existing object" do
          expect{
            delete :destroy, :lesson_id => lc.lesson_id
          }.to change(LessonCompletion, :count).by(-1)
        end
      end
    end
  end
end