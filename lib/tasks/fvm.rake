require 'yaml'
require 'rdiscount'

namespace :fvm do
  
  desc "Generates pages/index.html from README.md"
  task :index do
    File.open( Rails.root.join( 'app', 'views', 'pages', 'index.html' ), 'w' ) do |f|
      f << RDiscount.new( IO.read( Rails.root.join( 'README.md' ) ) ).to_html
    end
  end
  
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