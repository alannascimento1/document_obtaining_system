# frozen_string_literal: true

class InstitutionSearchsController < ApplicationController
  layout 'base'

  def index
    @institutions = Institution.where('name LIKE ?', "%#{params[:search]}%")
    @records = @institutions.paginate(page: params[:page])

    @document_records = DocumentRecord.all

    redirect_to(pages_index_path(page: params[:page], search: params[:search]))
  end
end
