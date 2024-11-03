class ExportDataController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.csv { send_data Institution.to_csv, filename: "institutions-#{Date.today}.csv" }
    end
  end
end
