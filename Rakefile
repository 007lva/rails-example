# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

desc "Runs the test suite againsts each different environment"
task :all_specs do
  require 'tempfile'

  script = <<-BASH
#!/bin/bash
set -x
set -e
BASH

  {
    "DATABASE_ADAPTER" => %w(mysql postgres),
    "CAPYBARA_DRIVER" => %w(firefox chrome poltergeist webkit)
  }.each do |key, values|
    values.each do |value|
      script << "#{key}=#{value} ./bin/rspec\n"
    end
  end

  puts "Running script:"
  puts ""
  puts script
  puts ""

  tempfile = Tempfile.new('tests.sh')
  tempfile.write(script)
  tempfile.close

  File.chmod(0777, tempfile.path)

  exec "#{tempfile.path}"
end

task :default => [ :spec ]

RailsExample::Application.load_tasks
