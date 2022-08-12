# frozen_string_literal: true

class AboutPage::BeliefComponent < ViewComponent::Base
  with_collection_parameter :belief

  def initialize(belief:)
    @belief = belief
  end
end
