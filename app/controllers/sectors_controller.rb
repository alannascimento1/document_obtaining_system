class SectorsController < ActionController::Base
  layout 'base'

  def index
    @sectors = Sector.all
  end

  def edit
    @sector = Sector.find(params[:id])
    @sectors = Sector.all
  end

  def new
    @sectors = Sector.all
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

  def update
    @sector = Sector.find(params[:id])
    @sectors = Sector.all

    if @sector.update(sector_params)
      @sectors = Sector.all

      flash[:notice] = "Setor atualizado com sucesso!"
      render :edit, status: :ok
    else
      flash[:notice] = "Setor não pode ser atualizado!"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @sector = Sector.find(params[:id])
    @sectors = Sector.all
    @sector.destroy

    render :destroy, status: :ok
  end

  private
  def sector_params
    params.require(:sector).permit(:name)
  end
end
