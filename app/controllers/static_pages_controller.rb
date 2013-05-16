class StaticPagesController < ApplicationController

  def home
    @splash_email = SplashEmail.new
  end

end
