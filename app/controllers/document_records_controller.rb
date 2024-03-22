class DocumentRecordsController < ApplicationController
  layout 'base'

  def index
    @document_records = DocumentRecord.all
  end

  def new; end

  def edit
    @document_record = DocumentRecord.find(params[:id])
  end

  def create
    @document_record = DocumentRecord.new(document_record_params.merge(user_id: current_user.id))

    if @document_record.save
      flash[:notice] = "Registro de Documento criado com sucesso!"
      render :new, status: :ok
    else
      flash[:notice] = "Registro de Documento não pode ser criado!"
      render :new, status: :unprocessable_entity
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
    params.require(:document_record).permit(:institution_id, :state, :information, :document_type_id, :received_from)
  end
end
