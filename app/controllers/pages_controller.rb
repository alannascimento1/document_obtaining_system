class PagesController < ApplicationController
  layout 'base'

  def index
    @document_records = DocumentRecord.all
  end
end
