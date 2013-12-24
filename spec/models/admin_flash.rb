require 'spec_helper'

describe AdminFlash do
   
  before { @admin_flash = AdminFlash.new(:message => "Lorem ipstum", :expires => 2.days.from_now) }
    
  subject { @admin_flash }
  
  it { should respond_to(:message) }
  it { should respond_to(:expires) }
    
  it { should be_valid }
   
  describe "when 'message' is blank" do 
    before { @admin_flash.message = " " }
    
    it { should_not be_valid }
  end
  
  describe "when 'expires' is not a datetime object" do
    dates = %w{12343 "invalid" :invalid}
    
    it "should not be valid" do
      dates.each do |date|
        @admin_flash.expires = date
        expect(@admin_flash).not_to be_valid
      end
    end
  end
  
  describe "when 'expires' is in the past"
  describe "when AdminFlash is valid"
  
    
end
   
  
  