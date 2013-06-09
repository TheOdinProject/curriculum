require 'spec_helper'

describe CalEventsController do

  let(:user) { FactoryGirl.create(:user) }
  let(:project) { FactoryGirl.create(:content_bucket) }
  let!(:ce) { FactoryGirl.create(:cal_event, :creator => user ) }

  context "before authentication" do
    it "GET #index unauthorized" do
      get :index
      assert_response 401
    end
    it "POST #create unauthorized" do
      post :create, FactoryGirl.attributes_for(:cal_event)
      assert_response 401
    end
    it "DELETE #destroy unauthorized" do
      delete :destroy, :id => ce.id
      assert_response 401
    end
    it "PUT #update unauthorized" do
      put :update, :id => ce.id
      assert_response 401
    end
  end


  context "after authentication" do
    before do
      sign_in(user)
    end


    describe "GET #index" do
      context "when user has created an event" do
        context "but not specified any projects" do
          it "returns nothing" do
            expected = [].to_json
            get :index
            response.body.should == expected
          end
        end

        context "and specified a project" do
          before do
            user.content_buckets << project
            user.save!
          end

          it "populates an array with the user's event" do
            get :index
            rb = JSON.parse(response.body)
            rb[0]["id"].should == ce.id
            rb[0]["title"].should == ce.summary
            rb[0]["start"].to_datetime.should == ce.start
            rb[0]["end"].to_datetime.should == ce.end
          end


          context "when other similarly-filtered events exist" do
            before do
              user2 = FactoryGirl.create(:user)
              ce2 = FactoryGirl.create(:cal_event, :creator => user2)
              user2.content_buckets << project
              user2.save!
            end

            it "populates an array with both events" do
              get :index
              rb = JSON.parse(response.body)
              rb.count.should == 2
            end
          end

          context "when other non-similarly filtered events exist" do
            before do
              user3 = FactoryGirl.create(:user)
              ce3 = FactoryGirl.create(:cal_event, :creator => user3)
              user3.content_buckets << FactoryGirl.create(:content_bucket)
              user3.save!
            end

            it "only populates the user's own events" do
              get :index
              rb = JSON.parse(response.body)
              rb.count.should == 1
            end
          end
        end
      end
    end

    describe "POST #create" do
      context "with valid attributes" do
        it "saves the new event to the database" do
          expect{
            post :create, FactoryGirl.attributes_for(:cal_event)
          }.to change(CalEvent, :count).by(1)
        end
      end

      context "with invalid attributes" do
        it "does not save the new event to the database" do
          expect{
            post :create, FactoryGirl.attributes_for(:invalid_cal_event)
          }.to change(CalEvent, :count).by(0)
        end

        it "provides a failure redirect" do
          post :create, FactoryGirl.attributes_for(:invalid_cal_event)
          assert_response 400 # bad request
        end
      end
    end

    describe "PUT #update" do
      context "with valid attributes" do
        before do
          put :update, FactoryGirl.attributes_for(:cal_event, :summary => "barfooEvent", :id => ce.id)
        end

        it "will update an event with current ids" do
          ce.reload
          ce.summary.should == "barfooEvent"
        end

        it "renders okay" do
          assert_response 200
        end

        it "populates an array with the user's event" do
          rb = JSON.parse(response.body)
          rb["id"].should == ce.id
        end
      end

      context "with invalid attributes" do
        before do
          put :update, FactoryGirl.attributes_for(:invalid_cal_event, :id => ce.id)
        end

        it "will not update" do
          pre_summary = ce.summary
          ce.reload
          ce.summary.should == pre_summary
        end
      end
    end

    describe "DELETE #destroy" do
      before do
        @ce2 = FactoryGirl.create(:cal_event, :creator => user)
        @other_user_ce = FactoryGirl.create(:cal_event)
      end

      it "deletes the current user's cal event" do
        expect{
          delete :destroy, id: @ce2.id
        }.to change(CalEvent, :count).by(-1)
      end

      it "won't delete another user's cal event" do
        expect{
          delete :destroy, id: @other_user_ce.id
        }.to change(CalEvent, :count).by(0)
      end

    end

  end

end