class MtestEqEvaluator
  def initialize(rhs)
    @rhs = rhs
  end

  def evaluate(lhs)
    return if lhs == rhs
    fail MtestAssertionError, "Equal assertion failed: #{lhs} != #{rhs}"
  end

  private

  attr_reader :rhs
end
