require 'spec_helper'

describe "Forums" do

  subject { page }

  describe "Forum Page" do

    before { visit forum_path }

    it { should have_css('div#forum') }

    # We will need to build some tests to verify that the forums load properly

  end
end