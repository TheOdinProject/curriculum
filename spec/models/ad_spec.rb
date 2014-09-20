require 'spec_helper'

describe Ad do

  context "with one ad created" do
  
    let(:ad){ FactoryGirl.create(:ad) }

    describe ".show_ads?" do

      context "with recently created user signed in" do
        it "should show the ad" do
          current_user = double("User", :created_at => 1.day.ago)
          expect(Ad.show_ads?(current_user)).to eq(true)
        end
      end

      context "with longtime user signed in" do
        it "should still show the ad" do
          current_user = double("User", :created_at => 11.days.ago)
          expect(Ad.show_ads?(current_user)).to eq(true)
        end
      end

      context "with anonymous visitor" do
        it "should show the ad" do
          expect(Ad.show_ads?(nil)).to eq(true)
        end
      end
    end
  end
end
