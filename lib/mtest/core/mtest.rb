module Mtest
  def self.describe(*args, &block)
    MtestDescribe.new *args, &block
  end
end
