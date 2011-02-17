class BuildWorker
  
  def parse( url )
    
    page = browser.get url
    
    html = page.search 'body'
    
    data = parser.parse html
    # puts html
    # puts html.class
    
    # 
    # puts page.methods - Object.methods
    
    # puts Mechanize::Page.instance_methods - Object.instance_methods
  
    # require 'pp'
    
    
    # pp data
    
    # { :version => '', :sdk => '', :milestone => '', :description => '', :date => Date.new, :url => }
    
    # puts data.to_yaml
    
  end
  
  def flatten_tables( tables )
    tables.map { |name, rows| rows }.flatten
  end
  
  protected
  
  def browser
    @browser ||= Mechanize.new
  end
  
  def parser
    @parser ||= Fvm::Parser.new
  end
  
end