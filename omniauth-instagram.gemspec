# -*- encoding: utf-8 -*-

require File.expand_path('../lib/omniauth-instagram/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Mihai Anca', 'AstraL']
  gem.email         = ['sawyer126@gmail.com']
  gem.description   = 'OmniAuth strategy for Instagram Basic Display.'
  gem.summary       = 'OmniAuth strategy for Instagram Basic Display.'
  gem.homepage      = 'https://github.com/milestep/omniauth-instagram'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = 'omniauth-instagram'
  gem.require_paths = ['lib']
  gem.version       = OmniAuth::Instagram::VERSION

  gem.add_dependency 'omniauth', '~> 1'
  gem.add_dependency 'omniauth-oauth2', '~> 1'

  # s.add_development_dependency 'dotenv', '>= 2.0'
  # s.add_development_dependency 'sinatra', '>= 2.0'
end
