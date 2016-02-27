require 'spec_helper'

describe AdminFlashHelper do
  
  describe "#disabled_flash_ids_from_cookies" do
    
    let(:cookies){ {"admin_flash_10" => "disabled","admin_flash_20"=>"disabled","not_a_flash_15"=>"disabled"} }

    it "should grab the flash IDs" do
      expect(disabled_flash_ids_from_cookies).to include(10)
    end
    
    it "should NOT grab an improperly formatted flash ID" do
      expect(disabled_flash_ids_from_cookies).not_to include(15)
    end
    
  end
  
end