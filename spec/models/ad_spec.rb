require 'rails_helper'

describe Ad do
  describe '.show_ads?' do
    it 'shows the ad' do
      expect(Ad.show_ads?).to eq(true)
    end
  end

  describe '.ve_banner' do
    let(:banner_ad_attrs) { { style: 'banner', client: 've', category: 'b2c_ab' } }
    let(:banner_ad) { double('BannerAd', banner_ad_attrs) }

    before do
      banner_ads = double
      allow(Ad).to receive(:where).with(banner_ad_attrs).and_return(banner_ads)
      allow(banner_ads).to receive(:sample).and_return(banner_ad)
    end

    it 'shows a random banner ad' do
      expect(Ad.ve_banner).to eql(banner_ad)
    end
  end

  describe '.ve_box' do
    let(:box_ad_attrs) { { style: 'box', client: 've', category: 'b2c_ab' } }
    let(:box_ad) { double('BoxAd', box_ad_attrs) }

    before do
      box_ads = double
      allow(Ad).to receive(:where).with(box_ad_attrs).and_return(box_ads)
      allow(box_ads).to receive(:sample).and_return(box_ad)
    end

    it 'shows a random box ad' do
      expect(Ad.ve_box).to eql(box_ad)
    end
  end

end
