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

  private

  def greenspace_params
    params.require(:greenspace).permit(:name)
  end

end
