# -*- encoding: utf-8 -*-

require "./lib/version"

Gem::Specification.new do |s|
  s.name        = "rails_gravatar"
  s.version     = RailsGravatar::VERSION
  s.date        = "2021-04-11"
  s.summary     = "rails_gravatar"
  s.description = "A simple gem for for generating Gravatar images and tags in a Rails environment."
  s.authors     = ["Ricky Chilcott"]
  s.email       = "ricky@missionmet.com"
  s.files       = ["lib/rails_gravatar.rb", "lib/version.rb"]
  s.homepage    = "https://github.com/mission-met/rails_gravatar"
  s.license     = "MIT"
  s.add_dependency "actionview"
  s.add_development_dependency "rspec"
end