module Card
  class HeaderComponent < ViewComponent::Base
    def initialize(classes: '')
      @classes = classes
    end

    private

    attr_reader :classes
  end
end
