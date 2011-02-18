require 'yaml'

namespace :fvm do
  
  desc "Deletes all build models"
  task :delete => :environment do
    Build.delete_all
  end
  
  desc "Creates build models from listed download pages"
  task :builds => [ :environment, :delete ] do
    
    worker = BuildWorker.new
    config = YAML.load_file( Rails.root.join( 'config/flex_sdk_pages.yml' ) )
    
    config.each do |sdk, props|
      
      builds = worker.parse sdk, props[ 'url' ]
      
      Build.create builds.select { |build| build[ :url ].any? }
      
    end
  end
end