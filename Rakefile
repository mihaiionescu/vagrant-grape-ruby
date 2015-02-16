require 'rake'
require 'active_record'

require File.expand_path('../config/application', __FILE__)

include ActiveRecord::Tasks
 
db_dir = File.expand_path('../db', __FILE__)
config_dir = File.expand_path('../config', __FILE__)
 
DatabaseTasks.env = ENV['ENV'] || ENV['RACK_ENV'] || 'vagrant'
DatabaseTasks.db_dir = db_dir
DatabaseTasks.migrations_paths = File.join(db_dir, 'migrate')
DatabaseTasks.database_configuration = YAML.load(File.read(File.join(config_dir, 'database.yml'))) unless DatabaseTasks.env.eql? "production"
# DatabaseTasks.seed_loader = Dummy::Application

task :environment do
  ActiveRecord::Base.configurations = DatabaseTasks.database_configuration
  ActiveRecord::Base.establish_connection DatabaseTasks.env.to_sym
end

load 'active_record/railties/databases.rake'

Dir[File.join(File.dirname(__FILE__), 'lib/tasks/**/*.rake')].each {|task| load task }




 
