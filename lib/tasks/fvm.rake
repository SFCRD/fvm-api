require 'yaml'

namespace :fvm do
  
  desc "Creates build models from listed download pages"
  task :builds => :environment do

    worker = BuildWorker.new

    config = YAML.load_file( Rails.root.join( 'config/flex_sdk_pages.yml' ) )

    require 'pp'
    

    config.each do |sdk, props|
      
      builds = worker.parse sdk, props[ 'url' ]
      
      builds.select { |build| build[ :url ].any? }.each do |build|
        
        # Build.create( build )
        
      end
      
    end

  end
  
end