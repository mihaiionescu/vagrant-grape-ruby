require 'active_record'

env = Dummy::Application.config.env

config_dir = Dummy::Application.config.root

ActiveRecord::Base.configurations = YAML.load(File.read(File.join(config_dir, 'config', 'database.yml')))

ActiveRecord::Base.establish_connection env

ActiveRecord::Base.logger = Logger.new(File.open(File.join(config_dir, 'log', "#{env}.log"), 'a+'))