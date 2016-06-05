class GreenspacesController < ApplicationController

  def index
    @greenspaces = Greenspace.all
  end

end
