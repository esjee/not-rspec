class MtestIt
  def initialize(&block)
    instance_eval &block
  end

  private

  def expect(something)
    MtestExpect.new something
  end

  def eq(rhs)
    MtestEqEvaluator.new rhs
  end
end
