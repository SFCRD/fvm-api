class BuildsController < ApplicationController
  respond_to :json
  
  def index
    @builds = Build.all
    respond_with @builds
  end

  def show
    @builds = Build.where( :sdk => params[ :id ] )
    respond_with @builds
  end

end
