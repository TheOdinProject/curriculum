RSpec.shared_examples 'unauthenticated request' do
  it 'returns http unauthorized' do
    expect(subject).to have_http_status(:unauthorized)
  end
end

RSpec.shared_examples 'unauthorized XHR request' do
  it 'returns a http status of forbidden' do
    request
    expect(response).to have_http_status(:forbidden)
  end
end
