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
    result = Institutions::Create.result(attributes: institution_params.to_h)

    if result.success?
      flash[:notice] = "#{CONSTANTS::DASHBOARD::INSTITUTION_TITLE} criada com sucesso!"
      render :new, status: :ok
    else
      flash[:notice] = "#{CONSTANTS::DASHBOARD::INSTITUTION_TITLE} não pode ser criada!"
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @institution = Institution.find(params[:id])
    result = Institutions::Update.result(institution: @institution, attributes: institution_params.to_h)

    if result.success?
      flash[:notice] = "#{CONSTANTS::DASHBOARD::INSTITUTION_TITLE} atualizada com sucesso!"
      render :edit, status: :ok
    else
      flash[:notice] = "#{CONSTANTS::DASHBOARD::INSTITUTION_TITLE} não pode ser atualizada!"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @institution = Institution.find(params[:id])
    @institution.destroy

    flash[:notice] = "#{CONSTANTS::DASHBOARD::INSTITUTION_TITLE} deletada com sucesso!"
    render :destroy, status: :ok
  rescue ActiveRecord::InvalidForeignKey => e
    flash[:notice] = "Esta #{CONSTANTS::DASHBOARD::INSTITUTION_TITLE} não pode ser deletada porque está sendo referenciada por outros registros."
    render :destroy, status: :unprocessable_entity
  end

  private
  def institution_params
    params.require(:institution).permit(:name, :sector_id, document_type_ids: [])
  end
end
