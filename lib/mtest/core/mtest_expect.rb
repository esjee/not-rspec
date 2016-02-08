class MtestExpect
  def initialize(lhs)
    @lhs = lhs
  end

  def to(evaluator)
    evaluator.evaluate lhs
  end

  def eq(rhs)
    return if lhs == rhs
    fail MtestAssertionError, "expect #{lhs} == #{rhs}"
  end

  private

  attr_reader :lhs
end
