# frozen_string_literal: true

class FaqItemComponent < ViewComponent::Base
  renders_one :question
  renders_one :answer
end
