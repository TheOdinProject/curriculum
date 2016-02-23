require "spec_helper"

describe UsersController do

  let(:user) { FactoryGirl.create(:user) }
  let(:other_user) { FactoryGirl.create(:user) }

  context "before authentication" do
    it "GET #index unauthorized" do
      get :index
      response.should redirect_to(new_user_session_path)
    end
    it "PUT #update unauthorized" do
      put :update, :id => user.id
      assert_response 302
    end
    it "GET #edit unauthorized" do
      get :edit, :id => user.id
      assert_response 302
    end
    it "GET #show unauthorized" do
      get :show, :id => user.id
      assert_response 302
    end
  end

  context "after authentication" do
    before do
      sign_in(user)
    end

    it "GET #index is authorized" do
      get :index
      assert_response 200
    end
    it "PUT #update is authorized" do
      put :update, :id => user.id, :user => { username: "foolong" }
      response.should redirect_to user_url(user)
    end
    it "GET #edit is authorized" do
      get :edit, :id => user.id
      assert_response 200
    end
    it "GET #show is authorized" do
      get :show, :id => user.id
      assert_response 200
    end

    describe "messing with other users' things" do

      it "GET #edit is unauthorized" do
        get :edit, :id => other_user.id
        response.should redirect_to user_url(other_user)
      end
      it "GET #edit shouldn't show edit" do
        response.should_not redirect_to edit_user_url(other_user)
      end
      it "PUT #update is unauthorized" do
        put :update, :id => other_user.id
        response.should redirect_to user_url(other_user)
      end
    end
  end
end
