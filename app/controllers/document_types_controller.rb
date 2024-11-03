class DocumentTypesController < ApplicationController
  layout 'base'

  def index
  end

  def edit
    @document_type = DocumentType.find(params[:id])
  end

  def new
  end

  def create
    @document_type = DocumentType.new(document_type_params)

    if @document_type.save
      flash[:notice] = "Tipo de documento criado com sucesso!"
      render :new, status: :ok
    else
      flash[:notice] = "Tipo de documento não pode ser criado!"
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @document_type = DocumentType.find(params[:id])

    if @document_type.update(document_type_params)
      flash[:notice] = "Tipo de documento atualizado com sucesso!"
      render :edit, status: :ok
    else
      flash[:notice] = "Tipo de documento não pode ser atualizado!"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @document_type = DocumentType.find(params[:id])
    @document_type.destroy

    flash[:notice] = "Tipo de documento deletado com sucesso!"
    render :destroy, status: :ok
  rescue ActiveRecord::InvalidForeignKey => e
    flash[:notice] = "Este tipo de documento não pode ser deletado porque está sendo referenciada por outro registro."
    render :destroy, status: :unprocessable_entity
  end

  private
  def document_type_params
    params.require(:document_type).permit(:name)
  end
end
