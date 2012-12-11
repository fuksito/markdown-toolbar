# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "markdown-toolbar/version"

Gem::Specification.new do |s|
  s.name        = "markdown-toolbar"
  s.version     = MarkdownToolbar::VERSION
  s.authors     = ["Vitaliy Yanchuk"]
  s.email       = ["fuksito@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{ Wrapper to help add markdown syntax into textarea }
  s.description = %q{ Helps with markdown editing }

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_development_dependency 'sprockets', '~> 2.0'
  s.add_development_dependency 'sinatra'

end
