class Nav::ItemComponent < ViewComponent::Base
  def initialize(path:, text:, test_id:, icon_path: nil, mobile: false)
    @path = path
    @text = text
    @test_id = test_id
    @icon_path = icon_path
    @mobile = mobile
  end

  def active?
    current_page?(path)
  end

  private

  attr_reader :path, :text, :test_id, :icon_path, :mobile
end
