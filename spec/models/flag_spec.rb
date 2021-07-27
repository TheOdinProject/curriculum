require 'rails_helper'

RSpec.describe Flag do
  subject(:flag) { described_class.new }

  it { is_expected.to belong_to(:flagger) }
  it { is_expected.to belong_to(:project_submission) }

  it { is_expected.to validate_presence_of(:reason) }
  it { is_expected.to define_enum_for(:status).with_values(%i[active resolved]) }
  it do
    is_expected.to define_enum_for(:taken_action)
      .with_values(%i[pending dismiss ban removed_project_submission notified_user])
  end
end
