class PagesController < ApplicationController
  layout 'base'

  def index
    @institutions = Institution.all
    @document_types = DocumentType.all
    @document_records = DocumentRecord.all
  end
end
