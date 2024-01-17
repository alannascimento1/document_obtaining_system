class SectorsController < ActionController::Base
  layout 'base'

  def index
    @sectors = Sector.all
  end

  def create
    @sector = Sector.new(params[:sector])

    if @sector.save
      flash[:notice] = "Setor criado com sucesso!"
      redirect_to(sectors_path)
    else
      flash[:error] = "Setor não pode ser criado!"
      render :new, status: :unprocessable_entity
    end
  end

  private
  def sector_params
    params.require(:sector).permit(:name)
  end
end
