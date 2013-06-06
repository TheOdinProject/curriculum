require 'spec_helper'

# currently allows overlapping events!!

describe User do
  
  subject(:user) { User.new(   
                            :username => "foobar", 
                            :email => "foo@bar.com", 
                            :password => "foobar" ) }

  it { should respond_to(:username) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should be_valid }

  context "when username is blank" do
    before do
      subject.username = ""
    end
    it { should_not be_valid }
  end

  context "when username is too short" do
    before do
      subject.username = "a"*3
    end
    it { should_not be_valid }
  end

  context "when username is too long" do
    before do
      subject.username = "a"*21
    end
    it { should_not be_valid }
  end

  context "when username is a duplicate" do
    before do
      User.create(:username => "foobar", :email => "bar@foo.com", :password => "foobar")
    end
    it { should_not be_valid }
  end

  context "when email is a duplicate" do
    before do
      User.create(:username => "barfoo", :email => "foo@bar.com", :password => "foobar")
    end
    it { should_not be_valid }
  end


end
