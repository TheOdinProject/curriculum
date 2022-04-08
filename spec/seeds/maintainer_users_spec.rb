require 'rails_helper'

RSpec.describe 'Generating Maintainer Users' do
  subject { described_class.as_json(course, between_dates) }

  context 'when development environment' do
    before do
      allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new('development'))
    end

    it 'creates maintainer users' do
      load './db/seeds/maintainer_users.rb'
      expect(User.count).to be > 1
    end
  end

  context 'when staging environment' do
    around do |example|
      ClimateControl.modify(
        STAGING: 'true'
      ) do
        example.run
      end
    end

    it 'creates maintainer users' do
      load './db/seeds/maintainer_users.rb'
      expect(User.count).to be > 1
    end
  end

  context 'when production environment' do
    before do
      allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new('production'))
    end

    it 'does not create any maintainer users' do
      load './db/seeds/maintainer_users.rb'
      expect(User.count).to eq(0)
    end
  end
end
