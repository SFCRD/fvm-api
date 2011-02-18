require 'yaml'

namespace :fvm do
  
  desc "Creates build models from listed download pages"
  task :builds => :environment do

    worker = BuildWorker.new

    config = YAML.load_file( Rails.root.join( 'config/flex_sdk_pages.yml' ) )

    require 'pp'
    

    config.each do |sdk, props|
      
      builds = worker.parse sdk, props[ 'url' ]
      
      Build.create builds.select { |build| build[ :url ].any? }
      
    end

  end
  
  desc "Delete all"
  task :delete => :environment do
    Build.delete_all
  end
  
end