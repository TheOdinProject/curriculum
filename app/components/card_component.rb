class CardComponent < ViewComponent::Base
  renders_one :header, Card::HeaderComponent
  renders_one :body, Card::BodyComponent
  renders_one :footer, Card::FooterComponent

  def initialize(classes: '', data_attributes: {})
    @classes = classes
    @data_attributes = data_attributes
  end

  def data_attributes
    @data_attributes
      .map { |key, value| "data-#{key.to_s.dasherize}=#{value.to_s.dasherize}" }
      .join(' ')
  end

  private

  attr_reader :classes
end
