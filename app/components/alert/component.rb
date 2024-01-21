class Alert::Component < ViewComponent::Base
  def initialize(title:, type: :notice)
    @title = title
    @type = type
  end

  private
  def main_classes
    {
      "notice" => "text-blue-800 rounded-lg bg-blue-50 dark:bg-gray-800 dark:text-blue-400",
      "error" => "text-red-800 rounded-lg bg-red-50 dark:bg-gray-800 dark:text-red-400",
      "success" => "text-green-800 rounded-lg bg-green-50 dark:bg-gray-800 dark:text-green-400",
    }
  end

  def button_classes
    {
      :notice => "bg-blue-50 text-blue-500 rounded-lg focus:ring-2 focus:ring-blue-400 p-1.5 hover:bg-blue-200",
      :error => "bg-red-50 text-red-500 rounded-lg focus:ring-2 focus:ring-red-400 p-1.5 hover:bg-red-200",
      :success => "bg-green-50 text-green-500 rounded-lg focus:ring-2 focus:ring-green-400 p-1.5 hover:bg-green-200",
    }
  end
end
