class Alert::Component < ViewComponent::Base
  def initialize(title:)
    @title = title
  end
end