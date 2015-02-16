require 'pry'

desc 'Fires up an interactive REPL using pry and the application environment loaded'
task :console => :environment do
  # ActiveRecord::Base.logger = Logger.new(STDOUT)
  binding.pry
end

task :c => :console