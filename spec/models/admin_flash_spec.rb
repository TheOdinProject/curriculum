require 'rails_helper'

describe AdminFlash do
  let(:admin_flashes) { [admin_flash, expired_admin_flash] }
  let(:admin_flash) {
    double('AdminFlash', id: 1, message: 'foo', expires: 1.days.from_now)
  }
  let(:expired_admin_flash) {
    double('AdminFlash', id: 1, message: 'bar', expires: 1.days.ago)
  }
  let(:current_time) { '2016-10-21 12:52' }

  it { is_expected.to validate_presence_of(:message) }
  it { is_expected.to validate_presence_of(:expires) }

  before do
    allow(AdminFlash).to receive(:order).with('created_at desc').
      and_return(admin_flashes)

    allow(Time).to receive(:now).and_return(current_time)

    allow(admin_flashes).to receive(:where).with('expires >= ?', current_time).
      and_return([admin_flash])
  end

  describe "#.unexpired_messages" do
    it "returns unexpired messages" do
      expect(AdminFlash.unexpired_messages).to eql([admin_flash])
    end
  end

  describe "#showable_messages" do
    it 'returns array ofs messages without cookies' do
      expect(AdminFlash.showable_messages([2])).to eql([admin_flash])
    end
  end
end
