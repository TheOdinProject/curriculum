require 'rails_helper'

RSpec.describe UserDecorator do
  subject(:user_decorator) { UserDecorator.new(user) }

  let(:user) {
    double(
      'User',
      projects: projects
    )
  }

  let(:projects) { [project] }
  let(:project) { double('Project') }

  describe '#has_projects?' do
    let(:project_exists?) { true }

    before do
      allow(projects).to receive(:exists?).and_return(project_exists?)
    end

    it 'returns true' do
      expect(user_decorator.has_projects?).to eql(true)
    end

    context 'when the user does not have any projects' do
      let(:projects) { [] }
      let(:project_exists?) { false }

      it 'returns false' do
        expect(user_decorator.has_projects?).to eql(false)
      end
    end
  end
end
