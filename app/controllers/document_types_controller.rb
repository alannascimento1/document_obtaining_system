class DocumentTypesController < ActionController::Base
  layout 'base'

  def index
    @document_types = DocumentType.all
  end

  def edit
    @document_type = DocumentType.find(params[:id])
    @document_types = DocumentType.all
  end

  def new
    @document_types = DocumentType.all
  end

  def create
    @document_type = DocumentType.new(document_type_params)
    @document_types = DocumentType.all

    if @document_type.save
      @document_types = DocumentType.all

      flash[:notice] = "Tipo de documento criado com sucesso!"
      render :new, status: :ok
    else
      flash[:notice] = "Tipo de documento não pode ser criado!"
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @document_type = DocumentType.find(params[:id])
    @document_types = DocumentType.all

    if @document_type.update(document_type_params)
      @document_types = DocumentType.all

      flash[:notice] = "Tipo de documento atualizado com sucesso!"
      render :edit, status: :ok
    else
      flash[:notice] = "Tipo de documento não pode ser atualizado!"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @document_type = DocumentType.find(params[:id])
    @document_types = DocumentType.all
    @document_type.destroy

    render :destroy, status: :ok
  end

  private
  def document_type_params
    params.require(:document_type).permit(:name)
  end
end
