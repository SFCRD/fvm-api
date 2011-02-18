class Flex < ActiveResource::Base
  self.site = 'http://localhost:3000'
  self.element_name = 'build'
  self.format = :json
  
  def self.sdk( name )
    all( :params => { :sdk => name } )
  end
  
  def self.version( name )
    all( :params => { :version => name } )
  end
end