class Ad < ActiveRecord::Base

  attr_accessible :category, :client, :image_path, :url, :style

  # Only display the VE banner for recent users for now
  def self.show_ve_banner?(current_user)
    if current_user
      return false if current_user.created_at < 10.days.ago
    end
    true
  end

  def self.ve_banner
    Ad.where(:style => "banner", :client => "ve", :category => "b2c_ab").sample
  end

end
