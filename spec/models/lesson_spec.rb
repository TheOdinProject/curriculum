require 'rails_helper'

RSpec.describe Lesson do
  subject(:lesson) { described_class.new }

  it { is_expected.to belong_to(:section) }
  it { is_expected.to have_one(:course).through(:section) }
  it { is_expected.to have_many(:project_submissions) }
  it { is_expected.to have_many(:lesson_completions) }
  it { is_expected.to have_many(:completing_users).through(:lesson_completions) }

  it { is_expected.to validate_presence_of(:position) }

  describe '.most_recent_updated_at' do
    before do
      Timecop.freeze(Time.utc(2021, 4, 14))
    end

    after do
      Timecop.return
    end

    it 'returns the most recently updated_at time stamp' do
      create(:lesson, updated_at: 2.weeks.ago)
      create(:lesson, updated_at: 1.week.ago)
      create(:lesson, updated_at: Time.utc(2021, 4, 10, 15))

      expect(described_class.most_recent_updated_at).to eql(Time.utc(2021, 4, 10, 15))
    end
  end

  describe '#position_in_section' do
    let(:section) { create(:section) }
    let(:first_lesson) { create(:lesson, position: 1, section: section) }
    let(:second_lesson) { create(:lesson, position: 2, section: section) }
    let(:third_lesson) { create(:lesson, position: 3, section: section) }

    it 'returns the position of the lesson in the section' do
      expect(first_lesson.position_in_section).to eql(1)
      expect(second_lesson.position_in_section).to eql(2)
      expect(third_lesson.position_in_section).to eql(3)
    end
  end

  describe '#import' do
    it 'uses the lesson content importer to get lesson content from github' do
      expect(LessonContentImporter).to receive(:for).with(lesson)
      lesson.import_content_from_github
    end
  end
end
