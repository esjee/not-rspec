module Mtest
  class MtestExpect
    def initialize(lhs: nil, block: nil)
      @lhs = lhs
      @block = block
    end

    def to(evaluator)
      evaluator.evaluate lhs, block
    end

    def eq(rhs)
      return if lhs == rhs
      fail MtestAssertionError, "expect #{lhs} == #{rhs}"
    end

    private

    attr_reader :lhs, :block
  end
end
