module Mtest
  class MtestDevNullWriter
    # This is probably a really bad idea
    def method_missing(_, *_)
    end
  end
end
