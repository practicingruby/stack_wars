gem "minitest", "~> 2.6.1"
gem "mocha", "~> 0.10.0" 

require "minitest/autorun"
require "mocha"

require_relative "../lib/stack_wars"

module MiniTest
  class Spec
    alias insist lambda
  end
end
