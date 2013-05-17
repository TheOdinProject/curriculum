require 'spec_helper'

describe SplashEmail do

  subject(:splash_email) { SplashEmail.new( email: "foo@bar.com") }

  it { should respond_to(:email) }

  context "when email is blank" do
    before do
      splash_email.email = ""
    end
    it { should_not be_valid }
  end 

  context "when email is a duplicate" do
    before do
      SplashEmail.create( email: "foo@bar.com" )
    end
    it { should_not be_valid }
  end

end