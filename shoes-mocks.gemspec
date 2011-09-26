# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "shoes/mocks/version"

Gem::Specification.new do |s|
  s.name        = "shoes-mocks"
  s.version     = Shoes::Mocks::VERSION
  s.authors     = ["Steve Klabnik", "Tobias Pfeiffer"]
  s.email       = ["steve@steveklabnik.com", "tobias.pfeiffer@student.hpi.uni-potsdam.de"]
  s.homepage    = "http://github.com/shoes/shoes-mocks"
  s.summary     = %q{Mocking for Shoes}
  s.description = %q{If you want your tests to be isolated, you need mocks. Mocking GUIs is hard. shoes-mocks to the rescue!}

  s.add_runtime_dependency 'rspec'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

