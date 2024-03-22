class InstitutionsController < ActionController::Base
  layout 'base'

  def index
  end

  def edit
    @institution = Institution.find(params[:id])
  end

  def new
  end

  def create
    @institution = Institution.new(institution_params)

    if @institution.save
      flash[:notice] = "Instituição criada com sucesso!"
      render :new, status: :ok
    else
      flash[:notice] = "Instituição não pode ser criada!"
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @institution = Institution.find(params[:id])

    if @institution.update(institution_params)
      flash[:notice] = "Instituição atualizada com sucesso!"
      render :edit, status: :ok
    else
      flash[:notice] = "Instituição não pode ser atualizada!"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @institution = Institution.find(params[:id])
    @institution.destroy

    flash[:notice] = "Instituição deletada com sucesso!"
    render :destroy, status: :ok
  rescue ActiveRecord::InvalidForeignKey => e
    flash[:notice] = "Esta instituição não pode ser deletada porque está sendo referenciada por outros registros."
    render :destroy, status: :unprocessable_entity
  end

  private
  def institution_params
    params.require(:institution).permit(:name, :sector_id)
  end
end
