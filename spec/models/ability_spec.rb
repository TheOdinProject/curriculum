require 'rails_helper'
require 'cancan/matchers'

describe Ability do
  describe 'Projects' do
    let(:user)         { FactoryBot.create(:user) }
    let(:admin_user)   { FactoryBot.create(:admin) }
    let(:user_project) { FactoryBot.build(:project, user_id: user.id) }
    let(:admin_project) { FactoryBot.build(:project, user_id: admin_user.id) }

    context 'standard user' do
      before do
        @ability = Ability.new(user)
      end

      it 'can only update and destroy his/her projects' do
        expect(@ability).to be_able_to(:update, user_project)
        expect(@ability).to be_able_to(:destroy, user_project)
      end

      it "cannot update/destroy other's projects" do
        expect(@ability).not_to be_able_to(:update, admin_project)
        expect(@ability).not_to be_able_to(:destroy, admin_project)
      end
    end

    context 'admin user' do
      before do
        @ability = Ability.new(admin_user)
      end

      it 'can update and destroy his/her projects' do
        expect(@ability).to be_able_to(:update, admin_project)
        expect(@ability).to be_able_to(:destroy, admin_project)
      end

      it "can update and destroy other's projects" do
        expect(@ability).to be_able_to(:update, user_project)
        expect(@ability).to be_able_to(:destroy, user_project)
      end
    end
  end
end
