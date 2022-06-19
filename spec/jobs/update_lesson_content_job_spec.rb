require 'rails_helper'

RSpec.describe UpdateLessonContentJob do
  subject(:job) { described_class.new }

  describe '#perform' do
    it 'updates the content of the lessons' do
      lesson_one = create(:lesson, github_path: '/lesson_one_github_url')
      lesson_two = create(:lesson, github_path: '/lesson_two_github_url')
      create(:lesson, github_path: '/lesson_three_github_url')

      VCR.use_cassette('update_lesson_content', record: :once, match_requests_on: [:method]) do
        response = job.perform(['/lesson_one_github_url', '/lesson_two_github_url'])

        expect(response).to contain_exactly(lesson_one, lesson_two)
      end
    end
  end
end
