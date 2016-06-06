class GreenspacesController < ApplicationController

  def index
    @greenspaces = Greenspace.all
  end

  def new
    @greenspace = Greenspace.new
  end

  def create
    Greenspace.create(greenspace_params)
    redirect_to '/greenspaces'
  end

  def show
    @greenspace = Greenspace.find(params[:id])
  end

  def edit
    @greenspace = Greenspace.find(params[:id])
  end

  def update
    @greenspace = Greenspace.find(params[:id])
    @greenspace.update(greenspace_params)

    redirect_to '/greenspaces'
  end

  private

  def greenspace_params
    params.require(:greenspace).permit(:name, :description)
  end

end
