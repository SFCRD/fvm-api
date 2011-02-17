require 'yaml'

namespace :fvm do
  
  desc "Creates build models from listed download pages"
  task :builds => :environment do

    worker = BuildWorker.new

    config = YAML.load_file( Rails.root.join( 'config/flex_sdk_pages.yml' ) )
    
    config.each do |sdk, props|
      
      # puts sdk
      # puts props[ 'url' ]
      
      result = worker.parse sdk, props[ 'url' ]
      
      require 'pp'
      
      pp result
      
    end

  end
  
end