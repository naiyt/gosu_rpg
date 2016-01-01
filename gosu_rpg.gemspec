lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gosu_rpg/version'

Gem::Specification.new do |gem|
  gem.name           =  'gosu_rpg'
  gem.version        =  GosuRPG::VERSION
  gem.date           =  '2016-01-01'
  gem.summary        =  'A framework for making an RPG using Gosu'
  gem.description    =  'TODO: Add description'
  gem.authors        =  ["Nate Collings"]
  gem.email          =  'nate@natecollings.com'
  gem.homepage       =  'https://github.com/naiyt/gosu_rpg'
  gem.license        =  'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = []
  gem.test_files    = gem.files.grep(%r{^(test|spec)/})
  gem.require_paths = ['lib']

  gem.required_ruby_version = '>= 2.2.3'

  gem.add_development_dependency 'rspec', '>= 3.0.0'
  gem.add_development_dependency 'rspec-mocks', '>= 3.0.0'

  gem.add_dependency 'pry'
  gem.add_dependency 'pry-nav'
end
