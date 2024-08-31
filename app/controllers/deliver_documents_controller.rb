class DeliverDocumentsController < ApplicationController
  layout 'base'

  def create
    @document_record = DocumentRecord.find(params[:document_record_id])
    @document_record.update(pendency: nil)

    flash[:notice] = "Documento entregue com sucesso!"
    redirect_to document_records_path(institution_id: @document_record.institution.id,
                                      status: DocumentRecord::PENDING,
                                      reference_date: @document_record.reference_date.strftime("%Y-%m"))
  end
end
