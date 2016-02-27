require 'spec_helper'

describe ContentBucket do
  
  subject(:content_bucket) { ContentBucket.new(   
                            :name => "foobar"
                          )}

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:users) }
  it { is_expected.to respond_to(:content_activations) }
  it { is_expected.to be_valid }

  context "when name is blank" do
    before do
      subject.name = ""
    end
    it { is_expected.not_to be_valid }
  end

  context "when name is a duplicate" do
    before do
      ContentBucket.create(:name => "foobar")
    end
    it { is_expected.not_to be_valid }
  end

  # pending "it should respond to users"


end
