class ForumsController < ApplicationController

  def show
    @discusjs = disqus_sso
  end

end
