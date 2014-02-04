require 'rake/clean'
require 'rake/testtask'
require 'rubygems'
require 'rspec'
require 'rspec/core/rake_task'
require 'cucumber'
require 'cucumber/rake/task'

CLEAN << 'tmp'

#############################################################################
#
# Test tasks
#
#############################################################################

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

#############################################################################
#
# Packaging tasks
#
#############################################################################

gem_name = AUNTIE::NAME
gem_version = AUNTIE::VERSION

desc "Build, tag and release the gem"
task :release do
  puts ""
  print "Are you sure you want to release #{gem_name} #{gem_version}? [y/N] "
  exit unless STDIN.gets.index(/y/i) == 0

  unless `git branch` =~ /^\* master$/
    puts "You must be on the master branch to release!"
    exit!
  end

  # Build gem and upload
  sh "gem build #{gem_name}.gemspec"
  sh "gem push #{gem_name}-#{gem_version}.gem"
  sh "rm #{gem_name}-#{gem_version}.gem"

  # Commit
  sh "git commit --allow-empty -a -m 'v#{gem_version}'"
  sh "git tag v#{gem_version}"
  sh "git push origin master"
  sh "git push origin v#{gem_version}"
end

desc "Build and install the gem"
task :install do
  sh "gem build #{gem_name}.gemspec"
  sh "gem install #{gem_name}-#{gem_version}.gem"
end

task :t => [:spec]
task :default => [:spec, :features]
