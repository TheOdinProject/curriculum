require 'spec_helper'

# currently allows overlapping events!!

describe CalEvent do
  
  subject(:cal_event) { CalEvent.new(   
                            :summary => "foobar", 
                            :start => DateTime.new(2013,1,1,1), 
                            :end => DateTime.new(2013,1,1,2), 
                            :creator_id => 1 ) }

  it { should respond_to(:summary) }
  it { should respond_to(:start) }
  it { should respond_to(:end) }
  it { should respond_to(:creator_id) }
  it { should be_valid }

  context "when summary is blank" do
    before do
      subject.summary = ""
    end
    it { should_not be_valid }
  end

  context "when start is blank" do
    before do
      subject.start = ""
    end
    it { should_not be_valid }
  end

  context "when end is blank" do
    before do
      subject.end = ""
    end
    it { should_not be_valid }
  end

  context "when creator_id is blank" do
    before do
      subject.creator_id = ""
    end
    it { should_not be_valid }
  end

  describe "time zone behavior from params" do
    context "when params includes a GMT offset" do
      before do
        cal_event.start = "Mon Jun 03 2013 10:00:00 GMT-0700 (PDT)"
        cal_event.save!
      end
      it "should return as valid UTC" do
        cal_event.reload.start.should == DateTime.new(2013,6,3,17)
      end
    end
  end


end
