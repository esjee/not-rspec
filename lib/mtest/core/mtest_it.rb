class MtestIt
  def initialize(&block)
    instance_eval &block
  end

  private

  def expect(something=nil, &block)
    if block_given?
      MtestExpect.new block: block
    else
      MtestExpect.new lhs: something
    end
  end

  def eq(rhs)
    MtestEqEvaluator.new rhs
  end

  def raise_error(expected_error)
    MtestRaiseErrorEvaluator.new expected_error
  end
end
