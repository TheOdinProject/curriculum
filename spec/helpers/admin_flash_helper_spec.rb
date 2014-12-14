require 'spec_helper'

describe AdminFlashHelper do
  
  describe "#disabled_flash_ids_from_cookies" do
    
    let(:cookies){ {"admin_flash_10" => "disabled","admin_flash_20"=>"disabled","not_a_flash_15"=>"disabled"} }

    it "should grab the flash IDs" do
      disabled_flash_ids_from_cookies.should include(10)
    end
    
    it "should NOT grab an improperly formatted flash ID" do
      disabled_flash_ids_from_cookies.should_not include(15)
    end
    
  end
  
end