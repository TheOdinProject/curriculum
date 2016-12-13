RSpec.shared_examples 'unauthorized request' do
  it 'returns http unauthorized' do
    expect(subject).to have_http_status(:unauthorized)
  end
end
