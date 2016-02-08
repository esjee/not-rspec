class MtestEqEvaluator
  include MtestBaseEvaluator

  def evaluate(lhs, block)
    return if lhs == rhs
    fail MtestAssertionError, "eq assertion failed: #{lhs} != #{rhs}"
  end
end
