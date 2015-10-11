#encoding: utf-8
Gem::Specification.new do |s|
  s.name        = 'hto'
  s.version     = '0.1.0'
  s.date        = '2015-10-11'
  s.summary     = "Easy way to access data from any hash"
  s.authors     = "Guillaume Troppée"
  s.email       = 'gtroppee@gmail.com'
  s.files       = Dir["README.md","Gemfile", "spec/*", "lib/**/*"]
  s.homepage    ='http://rubygems.org/gems/hto'
  s.license     = 'MIT'

  s.add_dependency "activesupport"
  s.add_development_dependency "rspec"
end