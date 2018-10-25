# -*- encoding: utf-8 -*-
require File.expand_path('../lib/gameye/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'gameye'
  gem.version       = Gameye::VERSION
  gem.date          = '2018-10-25'
  gem.summary       = "Gameye API"
  gem.description   = "A gem to interface with the Gameye API"
  gem.authors       = ["Arie"]
  gem.email         = 'rubygems@ariekanarie.nl'
  gem.files         = `git ls-files`.split($\)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.homepage      = 'http://github.com/Arie/gameye'

  gem.add_dependency "faraday",         "~> 0.8"

  gem.add_development_dependency "vcr"
  gem.add_development_dependency 'coveralls'
  gem.add_development_dependency "pry-nav"
  gem.add_development_dependency "rspec"
end
