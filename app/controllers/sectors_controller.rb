class SectorsController < ActionController::Base
  layout 'base'

  def index
  end

  def edit
    @sector = Sector.find(params[:id])
  end

  def new
  end

  def create
    @sector = Sector.new(sector_params)

    if @sector.save
      flash[:notice] = "Setor criado com sucesso!"
      render :new, status: :ok
    else
      flash[:notice] = "Setor não pode ser criado!"
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @sector = Sector.find(params[:id])

    if @sector.update(sector_params)
      flash[:notice] = "Setor atualizado com sucesso!"
      render :edit, status: :ok
    else
      flash[:notice] = "Setor não pode ser atualizado!"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @sector = Sector.find(params[:id])
    @sector.destroy

    flash[:notice] = "Setor deletado com sucesso!"
    render :destroy, status: :ok
  rescue ActiveRecord::InvalidForeignKey => e
    flash[:notice] = "Este setor não pode ser deletado porque está sendo referenciada por outros registros."
    render :destroy, status: :unprocessable_entity
  end

  private

  def sector_params
    params.require(:sector).permit(:name)
  end
end
