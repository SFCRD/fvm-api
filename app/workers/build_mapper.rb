class BuildMapper
  
  def map( builds )
    builds.map { |build| map_build build }
  end
  
  def map_build( build )
    {
      :version     => build[ 'Build' ],
      :sdk         => build[ 'SDK' ].to_s,
      :milestone   => build[ 'Milestone' ] || '',
      :description => build[ 'Description' ],
      :date        => Date.parse( build[ 'Build Date' ] ),
      :url         => URI.extract( build[ 'Open Source Flex SDK' ] ).first || ''
    }
  end

end