# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "markdown-toolbar/version"

Gem::Specification.new do |s|
  s.name        = "markdown-toolbar"
  s.version     = Markdown::Toolbar::VERSION
  s.authors     = ["Vitaliy Yanchuk"]
  s.email       = ["fuksito@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{ Wrapper to help add markdown syntax into textarea }
  s.description = %q{ Helps with markdown editing }

  s.rubyforge_project = "markdown-toolbar"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
