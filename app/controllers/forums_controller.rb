class ForumsController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @discusjs = disqus_sso
  end

end
