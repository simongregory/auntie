# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','bbc','version.rb'])
spec = Gem::Specification.new do |s|
  s.name = 'auntie'
  s.version = AUNTIE::VERSION
  s.author = 'Simon Gregory'
  s.email = 'simon.gregory@bbc.co.uk'
  s.homepage = 'https://github.com/simongregory/auntie'
  s.platform = Gem::Platform::RUBY
  s.summary = 'BBC News, Weather, Sport, and TV & Radio schedules right in your shell'
  s.description = 'BBC News, Weather, Sport, and TV & Radio schedules right in your shell'
  s.license = 'MIT'
  s.files = Dir['**/*']
  s.files.reject! { |fn| fn.match /\.(DS_Store|svn|git|tmproj|gem)|tmp|scratch/ }
  s.require_paths << 'lib'
  s.bindir = 'bin'
  s.executables << 'weather'
  s.executables << 'tv'
  s.executables << 'radio'
  s.executables << 'news'
  s.executables << 'sport'
  s.executables << 'auntie'
  s.add_development_dependency('rake')
  s.add_development_dependency('rspec')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_development_dependency('anticipate')
end
