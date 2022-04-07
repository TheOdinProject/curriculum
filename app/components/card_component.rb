class CardComponent < ViewComponent::Base
  renders_one :header, Card::HeaderComponent
  renders_one :body, Card::BodyComponent
  renders_one :footer, Card::FooterComponent

  def initialize(classes: '')
    @classes = classes
  end

  private

  attr_reader :classes
end
