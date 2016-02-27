require 'spec_helper'

describe AdminFlash do
  let(:admin_flash) { AdminFlash.new(:message => "Lorem ipstum", :expires => 2.days.from_now) } 
  let(:admin_flash_2) { AdminFlash.new(:message => "Lorem ipstum_2", :expires => 3.days.from_now) } 
  let(:expired_admin_flash) { AdminFlash.create(:message => "Lorem ipstum", :expires => 2.days.ago) }
    
  subject { admin_flash }
  
  it { is_expected.to respond_to(:message) }
  it { is_expected.to respond_to(:expires) }
    
  it { is_expected.to be_valid }
   
  describe "when 'message' is blank" do 
    before { admin_flash.message = " " }
    
    it { is_expected.not_to be_valid }
  end
  
  describe "#unexpired_messages" do
    before do
      admin_flash_2.save
      admin_flash.save
    end
    # tests to make sure it only grabs active flash messages
    it "returns unexpired messages" do
      expect(AdminFlash.unexpired_messages).to include( admin_flash )
    end  
    
    it "sorts the flashes in descending created_at order" do
      expect(AdminFlash.unexpired_messages).to eq( [admin_flash, admin_flash_2] )
    end
    
    it "does not return expired messages" do
      expect(AdminFlash.unexpired_messages).not_to include(expired_admin_flash)
    end
    
    
    
  end 
  
  describe "#showable_messages" do
    it 'returns array of messages without cookies' do
      disabled_flash_message = AdminFlash.create(message: "disabled in cookie", expires: 2.days.from_now) 
      allow(AdminFlash).to receive(:unexpired_messages).and_return([disabled_flash_message])
      expect(AdminFlash.showable_messages([disabled_flash_message.id])).not_to include(disabled_flash_message)
    end
    
  end  
  
  
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
      expect(admin_flash.update_attribute(:message, "Asdf Qwerty")).to be_truthy
    end  
  end  
  
end

  
  
