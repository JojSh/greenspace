class GreenspacesController < ApplicationController

  def index
    @greenspaces = Greenspace.all
  end

  def new
    
  end

end
