module Mtest
  class MtestIt
    attr_reader :assertion_error

    def initialize(mtest_describe, &block)
      @mtest_describe = mtest_describe
      @block = block
    end

    def evaluate
      instance_eval &block
      store_success_result
    rescue MtestAssertionError => assertion_error
      store_failure_result assertion_error
    end

    def report_evaluation_result(writer)
      if passed?
        writer.pass
      else
        writer.fail
      end
    end

    def passed?
      @assertion_error.nil?
    end

    def failed?
      !passed?
    end

    private

    attr_reader :mtest_describe, :block

    def method_missing(method_name, *args)
      # This allows user to define methods in the scope of the describe,
      # and still use it in an it.
      mtest_describe.send method_name, *args
    end

    def store_failure_result(assertion_error)
      @assertion_error = assertion_error
    end

    def store_success_result
      @assertion_error = nil
    end

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
end
