class DocumentRecordsController < ApplicationController
  layout 'base'

  def index
    @institution = Institution.find_by(id: params[:institution_id])
    @date = Date.parse( (params[:reference_month] || Time.zone.now.prev_month.strftime("%Y-%m")) + "-01")
    @status = params[:status] || DocumentRecord::DELIVERED
    @document_types = @institution.fetch_by_status_and_date(
      status: @status,
      date: @date
    )
    @document_with_pendencies = @institution.documents_with_pendency_to_month(date: @date)
  end

  def new
    @institution_id = params[:institution_id]
    @institution = Institution.find_by(id: @institution_id)
  end

  def edit
    @document_record = DocumentRecord.find(params[:id])
  end

  def create
    @document_record = DocumentRecord.new(document_record_params.merge(user_id: current_user.id))
    @institution = @document_record.institution
    if @document_record.save
      flash[:notice] = "Registro de Documento criado com sucesso!"
    else
      flash[:notice] = "Registro de Documento não pode ser criado!"
    end
  end

  def update
    @document_record = DocumentRecord.find(params[:id])
    if @document_record.update(document_record_params)
      flash[:notice] = "Registro de Documento atualizado com sucesso!"
      render :edit, status: :ok
    else
      flash[:notice] = "Registro de Documento não pode ser atualizado!"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @document_record = DocumentRecord.find(params[:id])
    @document_record.destroy

    render :destroy, status: :ok
  end

  private

  def document_record_params
    _params = params.require(:document_record).permit(:institution_id, :state, :information, :document_type_id, :received_from, :pendency, :reference_date)
    _params[:reference_date] = (_params[:reference_date]+"-01").to_date if _params[:reference_date].present?
    _params
  end
end
