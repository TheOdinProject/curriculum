require 'spec_helper'

describe "Forums" do

  subject { page }

  describe "Forum Page" do

    before { visit forum_path }

    it { 
      # save_and_open_page
      should have_css('div#moot-forum') }

    # We will need to build some tests to verify that the forums load properly

  end
end