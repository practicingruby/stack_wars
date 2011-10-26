gem "minitest", "~> 2.6.1"

require "minitest/autorun"
require "mocha"

require_relative "../lib/stack_wars"

module MiniTest
  class Spec
    alias insist lambda
  end
end
