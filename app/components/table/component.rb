class Table::Component < ViewComponent::Base
  include Turbo::FramesHelper

  def initialize(rows_object:)
    @rows_object = rows_object
  end
end
