require 'rails_helper'

RSpec.describe Section do
  subject(:section) do
    Section.new(
      title: 'test section',
      title_url: 'testsection.url.com',
      description: 'some test description',
      position: 2,
      course_id: course.id
    )
  end

  let(:course) { double('Course', id: 1) }

  it { is_expected.to belong_to(:course) }
  it { is_expected.to have_many(:lessons) }
  it do
    is_expected.to validate_uniqueness_of(:position)
      .with_message('Section position has already been taken')
  end
end
