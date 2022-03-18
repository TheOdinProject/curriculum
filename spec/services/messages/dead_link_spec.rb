require 'rails_helper'

RSpec.describe Messages::DeadLink do
  subject(:message) { described_class.new(flag) }

  let(:flag) do
    create(
      :flag,
      created_at: Time.zone.local(2021, 8, 1),
      id: 120,
      flagger: flagger,
      project_submission: flagged_submission,
      reason: 'I find it offensive'
    )
  end

  let(:flagger) { create(:user, username: 'OdinUser') }
  let(:flagged_submission) { create(:project_submission, lesson: lesson, user: user) }
  let(:lesson) { create(:lesson, title: 'test lesson1', has_live_preview: true) }
  let(:user) { create(:user, username: 'testuser1') }

  describe '#title' do
    let(:expected_title) { 'One of your submissions has been flagged on 01 Aug 2021' }

    it 'sets the title for the message' do
      expect(message.title).to eq(expected_title)
    end
  end

  describe '#content' do
    let(:content) do
      'Hey testuser1, your project test lesson1 has a broken link in your submission. ' \
        'Please update it by 08 Aug 2021 so it doesn\'t get removed!'
    end

    it 'sets the message for the message' do
      travel_to Time.zone.local(2021, 8, 1) do
        expect(message.content).to eq(content)
      end
    end
  end

  describe '#url' do
    it 'sets the url for the message' do
      expect(message.url).to eq("/lessons/#{lesson.slug}")
    end
  end
end
