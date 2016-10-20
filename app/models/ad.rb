class Ad < ActiveRecord::Base

  # Display VE ads for everyone
  def self.show_ads?
    true
  end

  # Samples a random VE banner ad
  def self.ve_banner
    Ad.where(style: 'banner', client: 've', category: 'b2c_ab').sample
  end

  # Samples a random VE box ad
  def self.ve_box
    Ad.where(style: 'box', client: 've', category: 'b2c_ab').sample
  end

end
