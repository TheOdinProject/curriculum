require 'spec_helper'

describe AdminFlash do
  let(:admin_flash) { AdminFlash.new(:message => "Lorem ipstum", :expires => 2.days.from_now) } 
  let(:expired_admin_flash) { AdminFlash.new(:message => "Lorem ipstum", :expires => 2.days_ago) }
 
    
  subject { admin_flash }
  
  it { should respond_to(:message) }
  it { should respond_to(:expires) }
    
  it { should be_valid }
   
  describe "when 'message' is blank" do 
    before { admin_flash.message = " " }
    
    it { should_not be_valid }
  end
  
  #describe "when AdminFlash is valid"
  
  #describe "when 'AdminFlash' message is created" do
  #  before { @admin_flash = AdminFlash.create(message: "Lorem ipsum", expires: 2.days.from_now) }
  #  it { expect(AdminFlash).to change(AdminFlash, :count).by(1) }
  #end 
  
  describe "#active_messages" do
    # tests to make sure it only grabs active flash messages
    it "returns unexpired messages" do
      active_messages.should include( admin_flash )
    end  
    
    it "does not return expired messages"
    
    
  end
  
#  describe "#cancelled_messages"
  
  describe "#showable_messages"  #should return the messages that are left
  
  
  describe "when 'AdminFlash' message is created" do
    it 'increases the number of messages of AdminFlash' do
      admin_flash = AdminFlash.new(message: "Lorem ipsum", expires: 2.days.from_now)
      expect { admin_flash.save }.to change { AdminFlash.count }.by(1)
    end  
  end
  
  describe "when 'AdminFlash' message is deleted" do
    it 'decreases the number of messages of AdminFlash' do
      admin_flash = AdminFlash.create(message: "Lorem ipsum", expires: 2.days.from_now)
      expect { admin_flash.destroy }.to change { AdminFlash.count }.by(-1)
    end  
  end
  
  describe "When 'AdminFlash' message is updated" do
    it 'returns true(update_attributes)' do
      admin_flash = AdminFlash.create(message: "Lorem ipsum", expires: 2.days.from_now)
      #assert true, admin_flash.update_attribute(:message => "Asdf Qwerty") 
      admin_flash.update_attribute(:message, "Asdf Qwerty").should be_true
    end  
  end  
  
end

  
  
