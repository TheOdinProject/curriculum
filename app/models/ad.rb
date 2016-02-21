class Ad < ActiveRecord::Base

  # Display VE ads for everyone
  def self.show_ads?(current_user)
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
