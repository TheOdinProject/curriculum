require 'spec_helper'

describe CalEventsController do

  let(:user) { FactoryGirl.create(:user) }

  context "after authentication" do
    before do
      sign_in(user)
    end


    describe "GET index" do
      context "when user has created an event" do
        it "populates an array including the user's events"

        context "when other similarly-filtered events exist" do
          it "populates an array of overlapping events"
        end
        context "when other non-similarly filtered events exist" do
          it "only populates the user's own events"
        end

      end
      
      it "renders the array of events to json"
    
    end

    describe "POST create" do
      context "with valid attributes" do
        it "saves the new event to the database" do
          expect{
            post :create, FactoryGirl.attributes_for(:cal_event)
          }.to change(CalEvent, :count).by(1)
        end
      end

      context "with invalid attributes" do
        it "does not save the new event to the database"
        it "provides a failure redirect"
      end
    end

    describe "DELETE destroy" do

    end

  end

end