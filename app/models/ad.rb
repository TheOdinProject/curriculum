class Ad < ActiveRecord::Base

  def self.show_ads?
    true
  end

  def self.ve_banner
    Ad.where(style: 'banner', client: 've', category: 'b2c_ab').sample
  end

  def self.ve_box
    Ad.where(style: 'box', client: 've', category: 'b2c_ab').sample
  end
end
