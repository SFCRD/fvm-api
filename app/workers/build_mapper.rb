class BuildMapper
=begin rdoc
  Maps an array of hashes to the build model structure
=end
  def map( builds )
    builds.map { |build| map_build build }
  end
=begin rdoc
  Maps a hash to the build model structure
=end
  def map_build( build )
    {
      :version     => version_from(     build ),
      :sdk         => sdk_from(         build ),
      :milestone   => milestone_from(   build ),
      :description => description_from( build ),
      :date        => date_from(        build ),
      :url         => url_from(         build )
    }
  end
=begin
  TODO refactor! this looks a little ugly at the moment
=end
  protected
=begin rdoc
  Finds the version number from a hash
=end
  def version_from( build )
    build[ 'Build' ]
  end
=begin rdoc
  Finds the sdk name from a hash. Stringifies if it is a float.
=end
  def sdk_from( build )
    build[ 'SDK' ].to_s
  end
=begin rdoc
  Finds the milestone string from a hash. Returns empty string if missing.
=end
  def milestone_from( build )
    build[ 'Milestone' ] || ''
  end
=begin rdoc
  Finds the table description from a hash.
=end
  def description_from( build )
    build[ 'Description' ]
  end
=begin rdoc
  Finds the date from a hash. Parses it into a date object.
=end
  def date_from( build )
    Date.parse( build[ 'Build Date' ] )
  end
=begin rdoc
  Finds the sdk url from a hash. Returns empty string if it is missing or is not a url.
=end
  def url_from( build )
    URI.extract( build[ 'Open Source Flex SDK' ] ).first || ''
  end
end