require "#{File.dirname(__FILE__)}/lib/stack_wars/version"

Gem::Specification.new do |s|
  s.name = "stack_wars"
  s.version = StackWars::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Gregory Brown"]
  s.email = ["gregory.t.brown@gmail.com"]
  s.homepage = "http://github.com/sandal/stack_wars"
  s.summary = "An abstract strategy board game about bases and killing d00ds"
  s.description = "An abstract strategy board game about bases and killing d00ds"
  s.files = Dir.glob("{bin,lib,test,examples,doc,data}/**/*") + 
    %w(README.md LICENSE RULES.txt)
  s.require_path = 'lib'
  s.executables = ["stack_wars"]

  s.add_development_dependency "minitest", "~> 2.6.1"

  s.required_ruby_version = ">= 1.9.2"
  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project = "stack_wars"
end

