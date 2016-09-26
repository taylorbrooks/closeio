# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "closeio/version"
require "base64"

Gem::Specification.new do |s|
  s.name          = "closeio"
  s.version       = Closeio::VERSION
  s.authors       = ["Taylor Brooks"]
  s.email         = ["dGJyb29rc0BnbWFpbC5jb20="].map{ |e| Base64.decode64(e) }
  s.homepage      = "https://github.com/taylorbrooks/closeio"
  s.summary       = %q{A Ruby wrapper for the CloseIO API}
  s.description   = %q{A Ruby wrapper for the CloseIO API -- a sales CRM built by salespeople, for salespeople.}
  s.license       = "MIT"

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test)/})

  s.require_paths = ["lib"]

  s.add_runtime_dependency     'faraday'
  s.add_runtime_dependency     'faraday_middleware'
  s.add_runtime_dependency     'json'
  s.add_runtime_dependency     'faraday_middleware-parse_json_object'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
end
