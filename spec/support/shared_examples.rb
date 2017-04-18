RSpec.shared_examples 'unauthenticated request' do
  it 'returns http unauthorized' do
    expect(subject).to have_http_status(:unauthorized)
  end
end

RSpec.shared_examples 'unauthorized request' do
  before { request }

  it 'redirects to the root path' do
    expect(response).to redirect_to(root_path)
  end

  it 'sets the flash' do
    expect(flash[:alert]).to eq('You are not authorized to do that')
  end
end
