# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "kewd/version"

Gem::Specification.new do |s|
	s.name = "kewd"
	s.version = Kewd::VERSION
	s.platform = Gem::Platform::RUBY
	s.authors = ["Adam \"Arcath\" Laycock"]
	s.email = ["gems@arcath.net"]
	s.homepage = "http://www.arcath.net"
	s.summary = "Kewd is a job queueing system for ruby"

	s.add_development_dependency "rspec"

	s.files         = `git ls-files`.split("\n")
	s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
	s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
	s.require_paths = ["lib"]
end

