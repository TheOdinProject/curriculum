require 'spec_helper'

# describe OmniauthCallbacksController do


#   let!(:user) { FactoryGirl.create(:user) }

#   it "making a request without cookie token " do
#     get "/users/auth/github/callback"
#     last_response.status.should eql(401)
#     error = {:error=>'You need to sign in or sign up before continuing.'}
#     last_response.body.should  eql(error.to_json)
#   end

# end

describe OmniauthCallbacksController, "handle github authentication callback" do

  before do
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:github]
  end


  describe "#annonymous user" do
    context "when github email doesn't exist in the system" do
      before(:each) do
        stub_env_for_omniauth
        visit root_path
        click_link "Signin with Github"

        @user = User.where(:email => "ghost@nobody.com").first
      end

      it { @user.should_not be_nil }

      it "should create authentication with github id" do
        authentication = @user.authentications.where(:provider => "github", :uid => "1234", legal_agreement: true).first
        authentication.should_not be_nil
      end

      it { should be_user_signed_in }

      it { response.should redirect_to tasks_path }
    end

    context "when github email already exist in the system" do
      before(:each) do
        stub_env_for_omniauth

        User.create!(:email => "ghost@nobody.com", :password => "my_secret", legal_agreement: true)
        get :github
      end

      it { flash[:notice].should == "Your email ghost@nobody.com is already exist in the system. You need to sign in first."}

      it { response.should redirect_to new_user_session_path }
    end
  end

  describe "#logged in user" do
    context "when user don't have github authentication" do
      before(:each) do
        stub_env_for_omniauth

        user = User.create!(:email => "user1@example.com", :password => "my_secret", legal_agreement: true)
        sign_in user

        get :github
      end

      it "should add github authentication to current user" do
        user = User.where(:email => "user1@example.com").first
        user.should_not be_nil
        fb_authentication = user.authentications.where(:provider => "github").first
        fb_authentication.should_not be_nil
        fb_authentication.uid.should == "1234"
      end

      it { should be_user_signed_in }

      it { response.should redirect_to authentications_path }

      it { flash[:notice].should == "github is connected with your account."}
    end

    context "when user already connect with github" do
      before(:each) do
        stub_env_for_omniauth

        user = User.create!(:email => "ghost@nobody.com", :password => "my_secret", legal_agreement: true)
        user.authentications.create!(:provider => "github", :uid => "1234")
        sign_in user

        get :github
      end

      xit "should not add new github authentication" do
        user = User.where(:email => "ghost@nobody.com").first
        user.should_not be_nil
        fb_authentications = user.authentications.where(:provider => "github")
        fb_authentications.count.should == 1
      end

      xit { should be_user_signed_in }

      xit { flash[:notice].should == "Signed in successfully." }

      xit { response.should redirect_to tasks_path }

    end
  end

end

def stub_env_for_omniauth
  # This a Devise specific thing for functional tests. See https://github.com/plataformatec/devise/issues/closed#issue/608
  request.env["devise.mapping"] = Devise.mappings[:user]
  env = { "omniauth.auth" => { "provider" => "github", "uid" => "123455","legal_agreement" => true, "extra" => { "user_hash" => { "email" => "ghost@nobody.com" } } } }
  request.env["omniauth.auth"] = env["omniauth.auth"]
end
