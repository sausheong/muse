# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "muse/version"

Gem::Specification.new do |s|
  s.name        = "muse"
  s.version     = Muse::VERSION
  s.authors     = ["Chang Sau Sheong", "Ng Tze Yang"]
  s.email       = ["sausheong@gmail.com", "ngty77@gmail.com"]
  s.homepage    = "https://github.com/sausheong/muse"
  s.summary     = %q{Muse is a Ruby DSL for making music}
  s.description = %q{Muse is a complete music creation package including writing and up to creating WAV files}

  s.files         = Dir["lib/**/*.rb"]
  s.test_files    = Dir["spec/**/*.rb"]
  s.require_paths << 'lib'

  s.add_dependency 'bindata'
  s.add_dependency 'parallel'
end