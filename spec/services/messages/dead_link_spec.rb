require 'rails_helper'

RSpec.describe Messages::DeadLink do
  subject(:message) { described_class.new(flag) }

  let(:flag) do
    create(
      :flag,
      id: 120,
      flagger: flagger,
      project_submission: flagged_submission,
      reason: 'I find it offensive'
    )
  end

  let(:flagger) { create(:user, username: 'OdinUser') }
  let(:flagged_submission) { create(:project_submission, lesson: lesson, user: user) }
  let(:lesson) { create(:lesson, title: 'test lesson1') }
  let(:user) { create(:user, username: 'testuser1') }

  describe '#content' do
    let(:content) do
      'Hey testuser1, heads up your project submission for test lesson1 was flagged because it has a broken link. ' \
        'We aim to keep the submission lists useful and so we remove any submissions with broken links often. ' \
        'When you get a moment, can you update your submission with the correct links for us please? ' \
        'Otherwise we will have to remove it on 08 Aug 2021.'
    end

    it 'sets the message for the notification' do
      travel_to Time.zone.local(2021, 8, 1) do
        expect(message.content).to eq content
      end
    end
  end

  describe '#url' do
    it 'sets the url for the message' do
      expect(message.url).to eq '/lessons/test-lesson1'
    end
  end
end
