# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "basecamper/version"

Gem::Specification.new do |s|
  s.name        = "basecamper"
  s.version     = Basecamper::VERSION
  s.authors     = ["Ryan Closner"]
  s.email       = ["ryan.closner@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/basecamper"
  s.summary     = %q{Basecamp API Wrapper}
  s.description = %q{Basecamp API Wrapper}

  s.rubyforge_project = "basecamper"

  {
    'activeresource'      => '>= 2.3.10',
  }.each {|lib, version| s.add_runtime_dependency lib, version }

  {
    'bundler'             => '~> 1.0.0',
    'cucumber'            => '~> 0.10.0',
    'rake'                => '~> 0.8.7',
    'rspec'               => '~> 2.5.0',
  }.each {|lib, version| s.add_development_dependency lib, version }

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
