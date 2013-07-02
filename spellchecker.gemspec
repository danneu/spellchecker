# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spellchecker/version'

Gem::Specification.new do |gem|
  gem.name          = "spellchecker"
  gem.version       = Spellchecker::VERSION
  gem.authors       = ["Dan Neumann"]
  gem.email         = ["danrodneu@gmail.com"]
  gem.description   = %q{A lil Ruby spellchecker that makes spelling corrections based on a word frequency lookup table.}
  gem.summary       = %q{A lil Ruby spellchecker that makes spelling corrections based on a word frequency lookup table.}

  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
