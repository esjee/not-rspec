module Mtest
  class MtestDescribe
    def initialize(described_class, &block)
      @described_class = described_class

      instance_eval &block
    end

    private

    attr_reader :described_class

    def it(msg = "", &block)
      MtestIt.new &block
    end
  end
end
