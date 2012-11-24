# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','bbc','version.rb'])
spec = Gem::Specification.new do |s|
  s.name = 'bbc-cli'
  s.version = BBC::VERSION
  s.author = 'Simon Gregory'
  s.email = 'simon.gregory@bbc.co.uk'
  s.homepage = 'http://www.bbc.co.uk'
  s.platform = Gem::Platform::RUBY
  s.description = 'Quick access to BBC services via the command line'
  s.summary = 'BBC weather and schedule data tool'
  s.files = Dir['**/*']
  s.files.reject! { |fn| fn.match /\.(DS_Store|svn|git|tmproj|gem)|tmp/ }
  s.require_paths << 'lib'
  s.bindir = 'bin'
  s.executables << 'weather'
  s.executables << 'tv'
  s.executables << 'radio'
  s.executables << 'news'
  s.executables << 'sport'
  s.add_development_dependency('rake')
  s.add_development_dependency('rspec')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_development_dependency('anticipate')
end
