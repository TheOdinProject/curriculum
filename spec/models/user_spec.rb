require 'spec_helper'

# currently allows overlapping events!!

describe User do


  subject(:user) { User.new(
                            :username => "foobar",
                            :email => "foo@bar.com",
                            :password => "foobar",
                            :legal_agreement => "true" )}

  before(:each) do
    allow(subject).to receive(:send_welcome_email)
  end

  it { is_expected.to respond_to(:username) }
  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:github) }
  it { is_expected.to respond_to(:twitter) }
  it { is_expected.to respond_to(:linkedin) }
  it { is_expected.to respond_to(:facebook) }
  it { is_expected.to respond_to(:about) }
  it { is_expected.to respond_to(:skype) }
  it { is_expected.to respond_to(:screenhero) }
  it { is_expected.to respond_to(:google_plus) }
  it { is_expected.to respond_to(:legal_agreement) }
  it { is_expected.to respond_to(:legal_agree_date) }

  # Associations
  it { is_expected.to respond_to(:content_activations) }
  it { is_expected.to respond_to(:content_buckets ) }
  it { is_expected.to respond_to(:user_pref) }
  it { is_expected.to respond_to(:lesson_completions) }
  it { is_expected.to respond_to(:completed_lessons) }

  it { is_expected.to be_valid }

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

    it { is_expected.to be_valid }
  end

  context "when username is blank" do
    before do
      subject.username = ""
    end
    it { is_expected.not_to be_valid }
  end

  context "when username is too short" do
    before do
      subject.username = "a"*3
    end
    it { is_expected.not_to be_valid }
  end

  context "when username is too long" do
    before do
      subject.username = "a"*21
    end
    it { is_expected.not_to be_valid }
  end

  context "when username is a duplicate" do
    before do
      u = User.new(:username => "foobar", :email => "bar@foo.com", :password => "foobar", :legal_agreement => "true")
      allow(u).to receive(:send_welcome_email)
      u.save
    end
    it { is_expected.not_to be_valid }
  end

  context "when email is a duplicate" do
    before do
      u = User.new(:username => "barfoo", :email => "foo@bar.com", :password => "foobar", :legal_agreement => "true")
      allow(u).to receive(:send_welcome_email)
      u.save
    end
    it { is_expected.not_to be_valid }
  end

  it "shouldn't yet have any completed lessons" do
    expect(subject.completed_lessons).to be_empty
  end

  context "when legal_agreement is blank" do
    before do
      subject.legal_agreement = ""
    end
    it { is_expected.not_to be_valid }
  end

  describe "when saving" do

    it "should call to build preferences" do
      expect(subject).to receive(:build_preferences)
      subject.save
    end

    it "should call to send a welcome email" do
      allow(subject).to receive(:send_welcome_email)
      expect(subject).to receive(:send_welcome_email)
      subject.save
    end
  end

  context "after saving user" do
    before do
      subject.save!
    end

    it "should create a preferences association as well" do
      expect(:user_pref).to_not be_nil
    end

    describe "#completed_lesson?" do

      context "for a lesson that has been completed" do

        it "should return true" do
          completed_lesson = double("Lesson")
          allow(user).to receive(:completed_lessons).and_return([completed_lesson])
          expect(user.completed_lesson?(completed_lesson)).to be_truthy
        end

      end

      context "for a lesson that has not been completed" do

        it "should return false" do
          uncompleted_lesson = double("Lesson")
          completed_lesson = double("Lesson")
          allow(user).to receive(:completed_lessons).and_return([completed_lesson])
          expect(user.completed_lesson?(uncompleted_lesson)).to be_falsey
        end

      end

    end

    describe "#latest_completed_lesson" do

      context "for a user with two completed lessons" do

        it "should return the latest lesson" do
          # ??? Is there a good way to actually test this method???

          # completed_lesson_early = double("Lesson")
          # completed_lesson_late = double("Lesson")
          # completed_time = Time.now
          # allow(completed_lesson_early).to receive(:created_at).and_return(completed_time)
          # allow(completed_lesson_late).to receive(:created_at).and_return(completed_time + 1.minute)
          # allow(user).to receive(:completed_lessons).and_return([completed_lesson_early, completed_lesson_late])
          # puts user.completed_lessons
          # expect(user.latest_completed_lesson).to be(completed_lesson_early)

        end
      end

    end

  end



end
