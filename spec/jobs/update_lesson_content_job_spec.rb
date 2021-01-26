require 'rails_helper'

RSpec.describe UpdateLessonContentJob do
  subject(:job) { described_class.new }

  describe '#perform' do
    let!(:lesson_one) { create(:lesson, url: '/lesson_one_github_url') }
    let!(:lesson_two) { create(:lesson, url: '/lesson_two_github_url') }
    let!(:lesson_three) { create(:lesson, url: '/lesson_three_github_url') }

    it 'updates the content of the lessons' do
      VCR.use_cassette('update_lesson_content', record: :once, match_requests_on: [:method]) do
        response = job.perform(['/lesson_one_github_url', '/lesson_two_github_url'])

        expect(response).to contain_exactly(lesson_one, lesson_two)
      end
    end
  end
end
