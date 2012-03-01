# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "muse/version"

Gem::Specification.new do |s|
  s.name        = "muse"
  s.version     = Muse::VERSION
  s.authors     = ["pls fix me asap"]
  s.email       = ["plsfix@me.asap"]
  s.homepage    = "https://github.com/sausheong/muse"
  s.summary     = %q{use is a Ruby DSL for making music}
  s.description = %q{}

  s.files         = Dir["#{File.dirname(__FILE__)}/lib/**/*.rb"]
  s.test_files    = Dir["#{File.dirname(__FILE__)}/spec/**/*.rb"]
  s.require_paths = [File.expand_path('../lib', __FILE__)]

  s.add_dependency 'bindata'
end
