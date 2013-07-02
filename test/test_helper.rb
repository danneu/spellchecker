require "spellchecker"
require "minitest/autorun"
require "wrong/adapters/minitest"
require "wrong/message/string_comparison"
require "wrong/message/array_diff"
require "turn"
include Wrong

module Kernel
  alias_method :context, :describe
end

module Helper
end




