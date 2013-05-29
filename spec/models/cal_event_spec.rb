require 'spec_helper'

# currently allows overlapping events!!

describe CalEvent do
  
  subject(:cal_event) { CalEvent.new(   
                            :summary => "foobar", 
                            :start => Time.new(2013,1,1,1), 
                            :end => Time.new(2013,1,1,2), 
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




end
