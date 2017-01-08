class Ad < ApplicationRecord
  def self.show_ads?
    true
  end

  def self.ve_banner
    where(style: 'banner', client: 've', category: 'b2c_ab').sample
  end

  def self.ve_box
    where(style: 'box', client: 've', category: 'b2c_ab').sample
  end
end
