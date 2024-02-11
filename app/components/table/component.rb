class Table::Component < ViewComponent::Base
  include Turbo::FramesHelper
  renders_one :header
  renders_one :set_rows

  def initialize()
  end
end
