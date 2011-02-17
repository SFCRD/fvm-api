class BuildWorker
  
  def parse( sdk, url )
    
    page = browser.get url
    
    html = page.search 'body'
    
    data = parser.parse html

    mapper.map flatten( sdk, data )
    
  end
  
  def flatten( sdk, tables )
    tables.map { |name, rows| 
      rows.map { |row| 
        row[ 'Description' ] = name
        row[ 'SDK' ] = sdk
        row
      }
    }.flatten
  end
  
  protected
  
  def mapper
    @mapper ||= BuildMapper.new
  end
  
  def browser
    @browser ||= Mechanize.new
  end
  
  def parser
    @parser ||= Fvm::Parser.new
  end
  
end