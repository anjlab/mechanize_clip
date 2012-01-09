# -*- encoding: utf-8 -*-
require File.expand_path('../lib/mechanize_clip/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Yury Korolev"]
  gem.email         = ["yury.korolev@gmail.com"]
  gem.description   = %q{Downloads files to temp files with Mechanize gem}
  gem.summary       = %q{Mechanize url fetcher for paperclip}
  gem.homepage      = "https://github.com/anjlab/mechanize_clip"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "mechanize_clip"
  gem.require_paths = ["lib"]
  gem.version       = MechanizeClip::VERSION

  gem.add_dependency "mechanize", ">= 2.1.0"
  gem.add_development_dependency "rspec", ">= 2.8"
end
