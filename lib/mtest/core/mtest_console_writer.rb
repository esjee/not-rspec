module Mtest
  class MtestConsoleWriter
    def initialize
    end

    def pass
      print "."
    end

    def fail
      print "F"
    end

    def end_of_test_run
      print "\n"
    end

    def report_failure(it)
      puts it.assertion_error
    end
  end
end
