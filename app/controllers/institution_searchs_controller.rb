# frozen_string_literal: true

class InstitutionSearchsController < ApplicationController
  layout 'base'

  def index
    Pagy::DEFAULT[:items] = 5
    @institutions = Institution.where('name LIKE ?', "%#{params[:search]}%")

    @pagy, @records = pagy(@institutions)
    @document_records = DocumentRecord.all

    redirect_to(pages_index_path(page: params[:page], search: params[:search]))
  end
end
