class SectorsController < ActionController::Base
  layout 'base'

  def index
    @sectors = Sector.all
  end

  def new
    @sectors = Sector.all
  end

  def edit
    respond_to do |format|
      format.turbo_stream
    end
  end

  def create
    @sector = Sector.new(sector_params)
    @sectors = Sector.all

    if @sector.save
      @sectors = Sector.all

      flash[:notice] = "Setor criado com sucesso!"
      render :new, status: :ok
    else
      flash[:notice] = "Setor não pode ser criado!"
      render :new, status: :unprocessable_entity
    end
  end

  private
  def sector_params
    params.require(:sector).permit(:name)
  end
end
