module Mtest
  class MtestRaiseErrorEvaluator
    include MtestBaseEvaluator

    def evaluate(_lhs, block)
      block.call
    rescue => raised_error
      handle_error raised_error
    ensure
      fail_unless_raised
    end

    attr_reader :has_raised
    alias_method :expected_error, :rhs
    alias_method :has_raised?, :has_raised

    private

    def handle_error(raised_error)
      @has_raised = true
      if raised_error.is_a? expected_error
      else
        fail MtestAssertionError, "raise_error assertion failed: "\
                                  "expected #{expected_error} got #{raised_error.class}"
      end
    end

    def fail_unless_raised
      unless has_raised?
        fail MtestAssertionError, "expected #{expected_error} to be raised, but nothing was raised"
      end
    end
  end
end
