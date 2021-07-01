require 'rails_helper'

RSpec.describe 'Static Pages', type: :request do
  describe 'GET #index' do
    it 'returns all points ordered by the highest amount' do
      highest_points = create(:point, points: 6)
      middle_points = create(:point, points: 5)
      lowest_points = create(:point, points: 1)

      get api_points_path
      expect(JSON.parse(response.body)).to eq(
        [highest_points, middle_points, lowest_points].map(&:as_json)
      )
    end

    context 'when limit and offset params are provided' do
      it 'returns the filtererd points ordered by highest' do
        create(:point, points: 6)
        create(:point, points: 1)
        middle_points = create(:point, points: 5)

        get api_points_path(offset: 1, limit: 1)
        expect(JSON.parse(response.body)).to eq([middle_points.as_json])
      end
    end
  end

  describe 'GET #show' do
    it 'returns the points for that discord user' do
      user_points = create(:point, points: 6, discord_id: 907)

      get api_point_path(id: 907)

      expect(JSON.parse(response.body)).to eq(user_points.as_json)
    end

    it 'returns an error message if the discord user cannot be found' do
      get api_point_path(id: 907)

      expect(JSON.parse(response.body)).to eq({ 'message' => 'Unable to find that user' })
    end
  end

  describe 'GET #create' do
    context 'when authenticated' do
      around do |example|
        ClimateControl.modify(
          ODIN_BOT_ACCESS_TOKEN: 'ODIN_BOT_ACCESS_TOKEN'
        ) do
          example.run
        end
      end

      it 'increments the discord users points' do
        user_points = create(:point, points: 6, discord_id: 1007)

        expect do
          post(
            '/api/points',
            params: { discord_id: 1007, value: 1 },
            headers: { 'Authorization' => 'Token ODIN_BOT_ACCESS_TOKEN' }
          )
        end.to change {
          user_points.reload.points
        }.from(6).to(7)
      end

      it 'creates a new points record if the discord user does not exist' do
        expect do
          post(
            '/api/points',
            params: { discord_id: 1007, value: 5 },
            headers: { 'Authorization' => 'Token ODIN_BOT_ACCESS_TOKEN' }
          )
        end.to change(Point, :count).from(0).to(1)
      end

      it 'returns an error message if it cannot increment the users points' do
        create(:point, points: 1, discord_id: 1007)

        post(
          '/api/points',
          params: { discord_id: 1007, value: 6 },
          headers: { 'Authorization' => 'Token ODIN_BOT_ACCESS_TOKEN' }
        )

        expect(JSON.parse(response.body)).to eq({ 'message' => 'Unable to update points' })
      end
    end

    context 'when unauthenticated' do
      it 'does not increment the discord users points' do
        user_points = create(:point, points: 6, discord_id: 1007)

        expect { post '/api/points', params: { discord_id: 1007 } }.not_to change(user_points, :points)
      end

      it 'does not create a points record if the discord user does not exist' do
        expect { post '/api/points', params: { discord_id: 1007 } }.not_to change(Point, :count)
      end
    end
  end
end
