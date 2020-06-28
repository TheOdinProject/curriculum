require 'rails_helper'

RSpec.describe ProjectDecorator do
  subject { ProjectDecorator.new(project) }

  let(:project) { double('Project', user: user) }
  let(:user) { double('User', username: 'John') }

  describe '#owner_name' do
    it 'returns the owner of the projects name' do
      expect(subject.owner_name).to eql('John')
    end
  end
end
