class DocumentRecordsController < ApplicationController
  layout 'base'

  def index
    @institution = Institution.find_by(id: params[:institution_id])
    @document_records = @institution.document_records
  end

  def new
    puts "---------------"
    puts params[:institution_id]
    puts "---------------"
    @institution_id = params[:institution_id]
  end

  def edit
    @document_record = DocumentRecord.find(params[:id])
  end

  def create
    @document_record = DocumentRecord.new(document_record_params.merge(user_id: current_user.id))
    @institution = @document_record.institution
    puts "---------------"
    puts turbo_frame_request?
    puts "---------------"
    if @document_record.save
      flash[:notice] = "Registro de Documento criado com sucesso!"
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
