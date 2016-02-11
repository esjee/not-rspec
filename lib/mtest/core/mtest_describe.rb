module Mtest
  class MtestDescribe
    def initialize(described_class, &block)
      @described_class = described_class
      @its = []

      instance_eval &block
    end

    def evaluate(writer=nil)
      writer = writer || default_writer

      run_all_test writer
      report_all_failed_tests writer
    end

    def evaluate_quietly
      evaluate MtestDevNullWriter.new
    end

    def number_of_tests_run
      @its.count
    end

    def all_passed?
      @its.all? &:passed?
    end

    def all_failed?
      @its.all? &:failed?
    end

    def assertion_errors
      @its.map &:assertion_error
    end

    private

    attr_reader :described_class

    def it(msg="", &block)
      @its << MtestIt.new(self, &block)
    end

    def default_writer
      MtestConsoleWriter.new
    end

    def run_all_test(writer)
      @its.each do |it|
        it.evaluate
        it.report_evaluation_result writer
      end
      writer.end_of_test_run
    end

    def report_all_failed_tests(writer)
      @its.each do |it|
        next unless it.failed?
        writer.report_failure it
      end
    end
  end
end
