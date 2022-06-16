require 'rails_helper'

RSpec.describe 'Lesson Completions', type: :request do
  describe 'GET #index' do
    around do |example|
      ClimateControl.modify(
        API_USERNAME: 'development',
        API_PASSWORD: 'qwerty123'
      ) do
        example.run
      end
    end

    context 'when authenticated' do
      let(:authentication_header) do
        {
          'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials(
            'development',
            'qwerty123'
          )
        }
      end

      it 'returns all lesson completions after the start date when only the start date is provided' do
        lesson = create(:lesson)
        create(:lesson_completion, created_at: 2.days.ago, lesson:)
        create(:lesson_completion, created_at: 3.days.ago, lesson:)
        create(:lesson_completion, created_at: 5.days.ago, lesson:)

        get api_lesson_completions_path, params: { start_date: 4.days.ago.to_s }, headers: authentication_header

        expect(JSON.parse(response.body).first).to match(
          a_hash_including(
            'sections' => [
              {
                'title' => lesson.section.title,
                'lessons' => [
                  'title' => lesson.title,
                  'completions' => 2
                ]
              }
            ]
          )
        )
      end

      it 'returns all lesson completions before the end date when only the end date is provided' do
        lesson = create(:lesson)
        create(:lesson_completion, created_at: 2.days.ago, lesson:)
        create(:lesson_completion, created_at: 3.days.ago, lesson:)
        create(:lesson_completion, created_at: 5.days.ago, lesson:)

        get api_lesson_completions_path, params: { end_date: 4.days.ago.to_s }, headers: authentication_header

        expect(JSON.parse(response.body).first).to match(
          a_hash_including(
            'sections' => [
              {
                'title' => lesson.section.title,
                'lessons' => [
                  'title' => lesson.title,
                  'completions' => 1
                ]
              }
            ]
          )
        )
      end

      it 'returns all lesson completions between the start and end dates when both dates are provided' do
        lesson = create(:lesson)
        create(:lesson_completion, created_at: 2.days.ago, lesson:)
        create(:lesson_completion, created_at: 4.days.ago, lesson:)
        create(:lesson_completion, created_at: 6.days.ago, lesson:)
        create(:lesson_completion, created_at: 11.days.ago, lesson:)

        get(
          api_lesson_completions_path,
          params: { start_date: 10.days.ago.to_s, end_date: 3.days.ago.to_s },
          headers: authentication_header
        )

        expect(JSON.parse(response.body).first).to match(
          a_hash_including(
            'sections' => [
              {
                'title' => lesson.section.title,
                'lessons' => [
                  'title' => lesson.title,
                  'completions' => 2
                ]
              }
            ]
          )
        )
      end

      it 'returns all lesson completions in the system when neither start nor end date is provided' do
        lesson = create(:lesson)
        create(:lesson_completion, created_at: 2.days.ago, lesson:)
        create(:lesson_completion, created_at: 3.days.ago, lesson:)
        create(:lesson_completion, created_at: 5.days.ago, lesson:)

        get api_lesson_completions_path, headers: authentication_header

        expect(JSON.parse(response.body).first).to match(
          a_hash_including(
            'sections' => [
              {
                'title' => lesson.section.title,
                'lessons' => [
                  'title' => lesson.title,
                  'completions' => 3
                ]
              }
            ]
          )
        )
      end
    end

    context 'when not authenticated' do
      let(:authentication_header) do
        {
          'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials(
            'wrong_username',
            'wrong_password'
          )
        }
      end

      it 'does not allow access' do
        get api_lesson_completions_path, params: { start_date: 4.days.ago.to_s }, headers: authentication_header

        expect(response.status).to be(401)
      end
    end
  end
end
