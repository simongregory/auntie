require 'rake/clean'
require 'rake/testtask'
require 'rubygems'
require 'rspec'
require 'rspec/core/rake_task'
require 'cucumber'
require 'cucumber/rake/task'

CLEAN << 'tmp'

desc 'Run features and generate HTML report'
Cucumber::Rake::Task.new(:features_html) do |t|
  t.cucumber_opts = "features --format html -o results.html --format progress -x"
  t.fork = false
end

desc 'Run features'
Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format progress -x"
  t.fork = false
end


desc "Run all examples"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = %w[--color]
end

task :t => [:spec]
task :default => [:spec, :features]
