class BuildsController < ApplicationController
  respond_to :json, :xml
  
  def index
    @builds = Build.scoped
    
    if params[ :sdk ]
      @builds = @builds.where( :sdk => params[ :sdk ] )
    end

    if params[ :version ]
      @builds = @builds.where( :version => params[ :version ] )
    end
    
    respond_with @builds
  end
end