class DocumentRecordsController < ApplicationController
  layout 'base'

  def index
    @document_records = DocumentRecord.all
  end

  def edit
    @document_record = DocumentRecord.find(params[:id])
    @document_records = DocumentRecord.all
    @institutions = Institution.all
    @document_types = DocumentType.all
  end

  def new
    @document_records = DocumentRecord.all
    @institutions = Institution.all
    @document_types = DocumentType.all
  end

  def create
    @document_record = DocumentRecord.new(document_record_params.merge(user_id: current_user.id))
    @document_records = DocumentRecord.all
    @institutions = Institution.all
    @document_types = DocumentType.all

    if @document_record.save
      @document_records = DocumentRecord.all

      flash[:notice] = "Registro de Documento criado com sucesso!"
      render :new, status: :ok
    else
      flash[:notice] = "Registro de Documento não pode ser criado!"
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @document_record = DocumentRecord.find(params[:id])
    @document_records = DocumentRecord.all
    @document_types = DocumentType.all
    @institutions = Institution.all

    if @document_record.update(document_record_params)
      @document_records = DocumentRecord.all

      flash[:notice] = "Registro de Documento atualizado com sucesso!"
      render :edit, status: :ok
    else
      flash[:notice] = "Registro de Documento não pode ser atualizado!"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @document_record = DocumentRecord.find(params[:id])
    @document_records = DocumentRecord.all
    @document_record.destroy

    render :destroy, status: :ok
  end

  private

  def document_record_params
    params.require(:document_record).permit(:institution_id, :state, :information, :document_type_id, :received_from)
  end
end
