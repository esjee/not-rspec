module Mtest
  module MtestBaseEvaluator
    def initialize(rhs)
      @rhs = rhs
    end

    def evaluate(lhs)
      fail 'implement me'
    end

    private

    attr_reader :rhs
  end
end
