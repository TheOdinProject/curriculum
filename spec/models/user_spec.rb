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
  it { should respond_to(:content_activations) }
  it { should respond_to(:content_buckets ) }
  it { should respond_to(:user_pref) }
  it { should respond_to(:github) }
  it { should respond_to(:twitter) }
  it { should respond_to(:linkedin) }
  it { should respond_to(:facebook) }
  it { should respond_to(:about) }
  it { should respond_to(:skype) }
  it { should respond_to(:screenhero) }
  it { should respond_to(:google_plus) }
  it { should be_valid }

  context "with all fields filled in" do
    before do
      subject.github = "github"
      subject.twitter = "twitter"
      subject.linkedin = "linkedin"
      subject.facebook = "facebook"
      subject.about = "about"
      subject.skype = "skype"
      subject.screenhero = "screenhero"
      subject.google_plus = "google_plus"
    end

    it { should be_valid }
  end

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

  context "after saving" do
    before do
      subject.save!
    end

    describe "it should create a preferences association as well" do
      its(:user_pref) { should_not be_nil }
    end
  end


end
