# frozen_string_literal: true

class FaqItemComponent < ViewComponent::Base
  renders_one :question
  renders_one :answer

  def initialize(item:)
    @item = item
  end

  private

  attr_reader :item
end
