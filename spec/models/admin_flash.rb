require 'spec_helper'

describe AdminFlash do
   
  before { @admin_flash = AdminFlash.new(:message => "Lorem ipstum", :expires => 2.days.from_now) }
    
  subject { @admin_flash }
  
  it { should respond_to(:message) }
  it { should respond_to(:expires) }
    
  it { should be_valid }
   
  describe "when 'message' is blank" 
  describe "when 'expires' is not a datetime object"
  describe "when 'expires' is in the past"
  describe "when AdminFlash is valid"
  
    
end
   
  
  