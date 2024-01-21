class Table::Component < ViewComponent::Base
  def initialize(sectors:)
    @sectors = sectors
  end
end