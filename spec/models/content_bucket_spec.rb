require 'spec_helper'

describe ContentBucket do
  
  subject(:content_bucket) { ContentBucket.new(   
                            :name => "foobar"
                          )}

  it { should respond_to(:name) }
  it { should respond_to(:users) }
  it { should respond_to(:content_activations) }
  it { should be_valid }

  context "when name is blank" do
    before do
      subject.name = ""
    end
    it { should_not be_valid }
  end

  context "when name is a duplicate" do
    before do
      ContentBucket.create(:name => "foobar")
    end
    it { should_not be_valid }
  end

  # pending "it should respond to users"


end
