class PagesController < ApplicationController
  layout 'base'

  def index
    @institutions = Institution.where('name LIKE ?', "%#{params[:search]}%")
    @records = @institutions.paginate(page: params[:page])
    @document_records = DocumentRecord.all
  end
end
