class Ad < ActiveRecord::Base

  attr_accessible :category, :client, :image_path, :url, :style

  # Only display the VE banner for recent users for now
  def self.show_ads?(current_user)
    if current_user
      return false if current_user.created_at < 10.days.ago
    end
    true
  end

  # Samples a random ve banner ad
  def self.ve_banner
    Ad.where(:style => "banner", :client => "ve", :category => "b2c_ab").sample
  end

  # Samples a random ve box ad
  def self.ve_box
    Ad.where(:style => "box", :client => "ve", :category => "b2c_ab").sample
  end

end
