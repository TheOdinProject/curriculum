module Paths
  class SelectButtonComponent < ViewComponent::Base
    def initialize(current_user:, path:, classes: '')
      @current_user = current_user
      @path = path
      @classes = classes
    end

    def render?
      current_user.present?
    end

    private

    attr_reader :current_user, :path, :classes
  end
end
